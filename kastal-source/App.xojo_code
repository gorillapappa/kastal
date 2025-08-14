#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleURL(request As WebRequest, response As WebResponse) As Boolean
		  if Request.Parameter ( "gimmie" ) <> "" and Request.Parameter ( "sid" ) <> "" then //We have a valid formated mediafile request
		    
		    //Check for logged in session to protect from unauthorized access to media.
		    Var sessionOK As Boolean = False
		    Var sID As String
		    sID = Request.Parameter ( "sid" )
		    For i As Integer = 0 To App.SessionCount - 1
		      if sid = App.SessionAt(i).Identifier then
		        if App.SessionAt(i).myState>10 then
		          sessionOK=True
		        end if
		        exit
		      end if
		    Next
		    
		    if sessionOK = false then
		      spit404(response)
		      return True
		    end if
		    
		    Var rs as RowSet
		    
		    select case Request.Parameter ( "gimmie" )
		    case "damoov"
		      
		      Try
		        rs = MyDB.SelectSQL("SELECT Location FROM tblMovies WHERE MovieID = ?", Request.Parameter ( "id" ))
		      Catch error As DatabaseException
		        spit404(response)
		        return True
		      End Try
		      
		      if rs.RowCount>0 then
		        rs.MoveToFirstRow
		        
		        Var f As New FolderItem(rs.Column("Location").StringValue, FolderItem.PathModes.Shell)
		        
		        If f <> Nil then
		          if  f.Exists Then
		            
		            if spitFile206(response, f, Request.Header("Range").LastField("="), "moov_"+Request.Parameter ( "id" )+f.Name.LastField(".")) = true then
		              return true
		            else
		              spit404(response)
		              return True
		            end if
		            
		          else
		            spit404(response)
		            return True
		          end if 
		          
		        else
		          spit404(response)
		          return True
		        end if
		        
		      else
		        spit404(response)
		        return True
		      end if
		      
		    case "datune"
		      
		      Try
		        rs = MyDB.SelectSQL("SELECT Location FROM tblTunes WHERE TuneID = ?", Request.Parameter ( "id" ))
		      Catch error As DatabaseException
		        spit404(response)
		      End Try
		      
		      if rs.RowCount>0 then
		        rs.MoveToFirstRow
		        
		        Var f As New FolderItem(rs.Column("Location").StringValue, FolderItem.PathModes.Shell)
		        
		        If f <> Nil then
		          if  f.Exists Then
		            
		            if spitFile206(response, f, Request.Header("Range").LastField("="), "tune_"+Request.Parameter ( "id" )+f.Name.LastField(".")) = true then
		              return true
		            else
		              spit404(response)
		              return True
		            end if
		            
		          else
		            spit404(response)
		            return True
		          end if 
		          
		        else
		          spit404(response)
		          return True
		        end if
		        
		      else
		        spit404(response)
		        return True
		      end if
		      
		    end select
		  end if
		  
		  //If we get here we just hand out the login page
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening(args() As String)
		  //App.Daemonize requires full path to app like this:
		  ///home/user/folder/kastal/kastal --port=8888
		  
		  #If Not DebugBuild Then // Do not try to daemonize a debug build
		    System.Log( System.LogLevelCritical, "Trying to daemonize kastal")
		    If Not App.Daemonize Then
		      System.Log( System.LogLevelCritical, "Could not daemonize kastal")
		      Return
		    End If
		    System.Log( System.LogLevelCritical, "Daemonized kastal")
		  #EndIf
		  
		  //Store myBasePath based on BaseURL to be able to feed files through HandleURL
		  myBasePath=App.BaseURL.Middle(1)
		  if myBasePath="" then
		    myBasePath="/"
		  else
		    myBasePath="/"+myBasePath+"/"
		  end if
		  
		  
		  //First we read in or create prefs
		  MyPrefsFile=App.ExecutableFile.Parent.Parent.Child("kastal.prefs")
		  MyPrefs=new XMLDocument
		  
		  if MyPrefsFile.Exists then
		    
		    Try
		      MyPrefs.LoadXML(MyPrefsFile)
		    Catch e As XmlException
		      System.Log( System.LogLevelCritical, "Could not create kastal.prefs - ")
		    End Try
		    
		  else
		    
		    Var root As XmlNode
		    
		    root = MyPrefs.AppendChild(MyPrefs.CreateElement("kastal"))
		    root.SetAttribute("version", "0")
		    MyPrefs.SaveXML(MyPrefsFile)
		  end if
		  
		  
		  MyDBFile=App.ExecutableFile.Parent.Parent.Child("kastal.sqlite")
		  MyDB = New SQLiteDatabase
		  MyDB.DatabaseFile = MyDBFile
		  
		  If MyDBFile.Exists Then
		    Try
		      MyDB.Connect
		    Catch error As DatabaseException
		      'LastAppException="DB Connection Error: " + error.Message
		    End Try
		    MyDB.WriteAheadLogging = True
		    'LastAppException="Connected to database successfully!"
		    
		    //Flush the wal out to DB file
		    MyDB.ExecuteSQL("PRAGMA wal_checkpoint;") 
		    
		  else
		    Try
		      MyDB.CreateDatabase
		    Catch error As IOException
		      System.Log( System.LogLevelCritical, "Could not create kastal.sqlite")
		    End Try
		    SetupDB
		  End If
		  
		  Exception
		    System.Log( System.LogLevelCritical, "Could not start kastal")
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  return true
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SetupDB()
		  MyDB.ExecuteSQL("PRAGMA journal_mode=WAL;")
		  MyDB.ExecuteSQL("PRAGMA encoding = ""UTF-8"";")
		  MyDB.ExecuteSQL("CREATE TABLE tblUsers (userID INTEGER PRIMARY KEY AUTOINCREMENT, creationDate TEXT, State INTEGER, Email TEXT, Password TEXT, liCookie TEXT, FirstName TEXT, LastName TEXT,  Adr1 TEXT, Adr2 TEXT,  PostalCode TEXT, City TEXT, Country TEXT, Phone TEXT, uURL TEXT)")
		  MyDB.ExecuteSQL("CREATE TABLE tblTunes (TuneID INTEGER PRIMARY KEY AUTOINCREMENT, Band TEXT, Album TEXT, Title TEXT, tracknum TEXT, Year TEXT, Hearts INTEGER, Location TEXT NOT NULL UNIQUE)")
		  MyDB.ExecuteSQL("CREATE TABLE tblMovies (MovieID INTEGER PRIMARY KEY AUTOINCREMENT, Title TEXT, meta TEXT, Year TEXT, Hearts INTEGER, Location TEXT NOT NULL UNIQUE)")
		  MyDB.ExecuteSQL("CREATE TABLE tblPlaylists (playlistID INTEGER PRIMARY KEY AUTOINCREMENT, user_ID INTEGER, Type  INTEGER, playlistName TEXT, playlistDescription TEXT, playlistMeta TEXT)")
		  MyDB.ExecuteSQL("CREATE TABLE tblPlaylistTunes (playlist_ID INTEGER, tune_ID  INTEGER, sortorder INTEGER)")
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
