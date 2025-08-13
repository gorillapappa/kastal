#tag Class
Protected Class Scan4MoviesThread
Inherits Thread
	#tag Event
		Sub Run()
		  //Establish separate connection to DB
		  tMyDBFile=App.ExecutableFile.Parent.Parent.Child("kastal.sqlite")
		  tMyDB = New SQLiteDatabase
		  tMyDB.DatabaseFile = tMyDBFile
		  
		  If tMyDBFile.Exists Then
		    Try
		      tMyDB.Connect
		    Catch error As DatabaseException
		      'Bail out, no DB?
		      return
		    End Try
		    tMyDB.WriteAheadLogging = True
		  End If
		  
		  
		  //Check if the path represents a folder
		  Var f As New FolderItem(GetPrefsValue("MyMovieFolder"), FolderItem.PathModes.Shell)
		  
		  if f <> nil then
		    if f.Exists then
		      
		      ScanFolder(f)
		      
		    end if
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Guessencoding(s As string) As TextEncoding
		  // Guess what text encoding the text in the given string is in.
		  // This ignores the encoding set on the string, and guesses
		  // one of the following:
		  //
		  //   * UTF-32
		  //   * UTF-16
		  //   * UTF-8
		  //   * Encodings.SystemDefault
		  //
		  // Written by Joe Strout
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  static isBigEndian, endianChecked As Boolean
		  if not endianChecked then
		    Dim temp As String = Encodings.UTF16.Chr( &hFEFF )
		    isBigEndian = (AscB( MidB( temp, 1, 1 ) ) = &hFE)
		    endianChecked = true
		  end if
		  
		  // check for a BOM
		  Dim b0 As Integer = AscB( s.MidB( 1, 1 ) )
		  Dim b1 As Integer = AscB( s.MidB( 2, 1 ) )
		  Dim b2 As Integer = AscB( s.MidB( 3, 1 ) )
		  Dim b3 As Integer = AscB( s.MidB( 4, 1 ) )
		  if b0=0 and b1=0 and b2=&hFE and b3=&hFF then
		    // UTF-32, big-endian
		    if isBigEndian then
		      #if RBVersion >= 2012.02
		        return Encodings.UTF32
		      #else
		        return Encodings.UCS4
		      #endif
		    else
		      return Encodings.UTF32BE
		    end if
		  elseif b0=&hFF and b1=&hFE and b2=0 and b3=0 and s.LenB >= 4 then
		    // UTF-32, little-endian
		    if isBigEndian then
		      return Encodings.UTF32LE
		    else
		      #if RBVersion >= 2012.02
		        return Encodings.UTF32
		      #else
		        return Encodings.UCS4
		      #endif
		    end if
		  elseif b0=&hFE and b1=&hFF then
		    // UTF-16, big-endian
		    if isBigEndian then
		      return Encodings.UTF16
		    else
		      return Encodings.UTF16BE
		    end if
		  elseif b0=&hFF and b1=&hFE then
		    // UTF-16, little-endian
		    if isBigEndian then
		      return Encodings.UTF16LE
		    else
		      return Encodings.UTF16
		    end if
		  elseif b0=&hEF and b1=&hBB and b1=&hBF then
		    // UTF-8 (ah, a sensible encoding where endianness doesn't matter!)
		    return Encodings.UTF8
		  end if
		  
		  // no BOM; see if it's entirely ASCII.
		  Dim m As MemoryBlock = s
		  Dim i, maxi As Integer = s.LenB - 1
		  for i = 0 to maxi
		    if m.Byte(i) > 127 then exit
		  next
		  if i > maxi then return Encodings.ASCII
		  
		  // Not ASCII; check for a high incidence of nulls every other byte,
		  // which suggests UTF-16 (at least in Roman text).
		  Dim nulls(1) As Integer  // null count in even (0) and odd (1) bytes
		  for i = 0 to maxi
		    if m.Byte(i) = 0 then
		      nulls(i mod 2) = nulls(i mod 2) + 1
		    end if
		  next
		  if nulls(0) > nulls(1)*2 and nulls(0) > maxi \ 2 then
		    // UTF-16, big-endian
		    if isBigEndian then
		      return Encodings.UTF16
		    else
		      return Encodings.UTF16BE
		    end if
		  elseif nulls(1) > nulls(0)*2 and nulls(1) > maxi \ 2 then
		    // UTF-16, little-endian
		    if isBigEndian then
		      return Encodings.UTF16LE
		    else
		      return Encodings.UTF16
		    end if
		  end if
		  
		  // it's not ASCII; check for illegal UTF-8 characters.
		  // See Table 3.1B, "Legal UTF-8 Byte Sequences",
		  // at <http://unicode.org/versions/corrigendum1.html>
		  Dim b As Byte
		  for i = 0 to maxi
		    select case m.Byte(i)
		    case &h00 to &h7F
		      // single-byte character; just continue
		    case &hC2 to &hDF
		      // one additional byte
		      if i+1 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &hBF then exit for
		      i = i+1
		    case &hE0
		      // two additional bytes
		      if i+2 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &hA0 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      i = i+2
		    case &hE1 to &hEF
		      // two additional bytes
		      if i+2 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      i = i+2
		    case &hF0
		      // three additional bytes
		      if i+3 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h90 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+3)
		      if b < &h80 or b > &hBF then exit for
		      i = i+3
		    case &hF1 to &hF3
		      // three additional bytes
		      if i+3 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+3)
		      if b < &h80 or b > &hBF then exit for
		      i = i+3
		    case &hF4
		      // three additional bytes
		      if i+3 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &h8F then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+3)
		      if b < &h80 or b > &hBF then exit for
		      i = i+3
		    else
		      exit for
		    end select
		  next i
		  if i > maxi then return Encodings.UTF8  // no illegal UTF-8 sequences, so that's probably what it is
		  
		  // If not valid UTF-8, then let's just guess the system default.
		  return Encodings.SystemDefault
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScanFolder(theFolder as FolderItem)
		  Dim sql, Title As  string
		  dim f as folderitem
		  
		  Dim Items As Integer = theFolder.Count
		  Dim theEncoding as TextEncoding 
		  
		  for i as Integer=0 to Items-1
		    
		    
		    
		    f=theFolder.ChildAt(i)
		    if f <> nil then
		      if f.Exists then
		        
		        if f.IsFolder then
		          ScanFolder(f)
		        else
		          Select Case f.Name.Right(4)
		          Case ".mp4", ".m4v", ".mov"//, ".m4u", "aac"
		            
		            //Check if the file is already added
		            Var rs As RowSet
		            Try
		              rs = tMyDB.SelectSQL("SELECT MovieID FROM tblMovies WHERE Location = ?", f.NativePath)
		              if rs.RowCount=0 then
		                
		                theEncoding = Guessencoding(f.Name)
		                Title=f.Name.DefineEncoding(theEncoding)
		                
		                if Title<>"" then
		                  //Update DB with data
		                  sql = "INSERT INTO tblMovies (Title, Location) VALUES(?, ?)"
		                  Try
		                    tMyDB.ExecuteSQL(sql, Title, f.NativePath)
		                  Catch error As DatabaseException
		                  End Try
		                end if
		                
		              end if
		            end Try
		            
		          end Select
		        end if
		      end if
		    end if
		  next
		  
		  
		  
		  Exception
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mediaFile As EKMediaFile
	#tag EndProperty

	#tag Property, Flags = &h0
		tMyDB As SQLiteDatabase = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		tMyDBFile As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Types"
			EditorType="Enum"
			#tag EnumValues
				"0 - Cooperative"
				"1 - Preemptive"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
