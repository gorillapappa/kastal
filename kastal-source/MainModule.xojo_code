#tag Module
Protected Module MainModule
	#tag Method, Flags = &h0
		Sub addTunetoPlaylist(tuneID As integer, playlistID As integer)
		  Try
		    MyDB.ExecuteSQL("INSERT INTO tblPlaylistTunes (playlist_ID, tune_ID) VALUES(?, ?)", playlistID, tuneID)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function echoMimeType(s As String) As String
		  dim ct() As string
		  ct=s.Split(".")
		  if UBound(ct)>0 then
		    
		    select case ct(UBound(ct))
		    case "css"
		      return "text/css"
		    case "html"
		      return "text/html"
		    case "png"
		      return "image/png"
		    case "jpg"
		      return "image/jpeg"
		    case "svg"
		      return "image/svg+xml"
		    case "js"
		      return "text/javascript"
		    case "mp4"
		      return "video/mp4"
		    case "m4v"
		      return "video/mp4"
		    case "mov"
		      return "video/quicktime"
		    case "mp3"
		      return "audio/mpeg"
		    case "m4a"
		      return "audio/mp4"
		    case "m4p"
		      return "audio/mp4"
		    case "aac"
		      return "audio/mp4"
		    case "ogg"
		      return "video/ogg"
		    case "ico"
		      return "image/x-icon"
		    case "ttf"
		      return "font/ttf"
		    else
		      return "?/?"
		    end select
		    
		  else
		    return "?/?"
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCleanUTF(thisString As String) As String
		  Var tmpText As String = EncodeHex(thisString)
		  tmpText = tmpText.ReplaceAll("EFBFBD","") // EFBFBD is the UTF-8 representation of an unknown character
		  Do Until tmpText.Right(2)<>"00" // Strip NULL characters from end of UTF text
		    tmpText = tmpText.Left( tmpText.Length - 2 )
		  Loop
		  Return DecodeHex(tmpText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPrefsValue(elementname As String) As String
		  dim n As XmlNode
		  dim nl As XmlNodeList
		  
		  'if prefsXML=nil then
		  'if not InnitiatePrefs then
		  ''MsgBox "Could not innitiate prefs."
		  'end if
		  'end if
		  
		  //find the element (if it exists)
		  
		  nl=MyPrefs.Xql("//"+elementname)
		  
		  if nl.Length>0 then
		    n=nl.Item(0)
		    if n.ChildCount>0 then
		      return n.child(0).Value
		    else
		      Return ""
		    end if
		  else
		    return ""
		  end if
		  
		  Exception 
		    'ex
		    'If ex IsA XmlException then
		    ''MsgBox "XmlException"
		    'elseif ex IsA NilObjectException then
		    ''MsgBox "Nil Object Exception"
		    'elseif ex IsA OutOfBoundsException then
		    ''MsgBox "Out of Bounds"
		    'elseif ex IsA TypeMismatchException then
		    ''MsgBox "Type Mismatch"
		    'End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PasswordHash(pw As string, itterations As integer) As String
		  dim s as string
		  s=EncodeHex(Crypto.PBKDF2(kSlt, pw, itterations, 32, Crypto.HashAlgorithms.SHA512))
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeTunefromPlaylist(tuneID As integer, playlistID As integer)
		  Try
		    MyDB.ExecuteSQL("DELETE FROM tblPlaylistTunes WHERE  playlist_ID = ? AND tune_ID =?", playlistID, tuneID)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SavePrefs()
		  if MyPrefsFile<>nil then
		    MyPrefs.SaveXml(MyPrefsFile)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendEmail(Recipient As String, Subject As String, BodyPT As String, BodyHT As String)
		  dim smtp As new SMTPSecureSocket
		  Dim mail as new emailMessage
		  
		  smtp.connectiontype=SSLSocket.TLSv12
		  smtp.address = GetPrefsValue("SMTPServer")
		  smtp.port = Val(GetPrefsValue("SMTPPort"))
		  smtp.username =  GetPrefsValue("EmailAdr")
		  smtp.password =  GetPrefsValue("EmailPw")
		  mail.fromAddress=GetPrefsValue("EmailAdr")
		  
		  mail.subject=Subject
		  mail.bodyPlainText = BodyPT
		  if BodyHT<>"" then
		    mail.BodyHTML = BodyHT
		  end if
		  mail.headers.appendHeader "X-Mailer","kastal"+Str(App.MajorVersion)+"."+Str(App.MinorVersion)+"."+Str(App.BugVersion)
		  
		  mail.AddRecipient(Recipient)
		  smtp.messages.Append mail
		  smtp.sendMail
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendEmail(Recipient As String, Subject As String, BodyPT As String, BodyHT As String, replyTo As string)
		  dim smtp As new SMTPSecureSocket
		  Dim mail as new emailMessage
		  
		  smtp.connectiontype=SSLSocket.TLSv12
		  smtp.address = GetPrefsValue("SMTPServer")
		  smtp.port = Val(GetPrefsValue("SMTPPort"))
		  smtp.username =  GetPrefsValue("EmailAdr")
		  smtp.password =  GetPrefsValue("EmailPw")
		  mail.fromAddress=GetPrefsValue("EmailAdr")
		  mail.Headers.AppendHeader("Reply-To", replyTo)
		  
		  mail.subject=Subject
		  mail.bodyPlainText = BodyPT
		  if BodyHT<>"" then
		    mail.BodyHTML = BodyHT
		  end if
		  mail.headers.appendHeader "X-Mailer","kastal"+Str(App.MajorVersion)+"."+Str(App.MinorVersion)+"."+Str(App.BugVersion)
		  
		  mail.AddRecipient(Recipient)
		  smtp.messages.Append mail
		  smtp.sendMail
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrefsValue(elementname As String, elementvalue As String)
		  dim n As XmlNode
		  dim nl As XmlNodeList
		  
		  //find the element (if it exists)
		  nl=MyPrefs.Xql("//"+elementname)
		  if nl.Length>0 then
		    n=nl.Item(0)
		    if n.ChildCount>0 then
		      n.child(0).Value=elementvalue
		    else
		      n.AppendChild(MyPrefs.CreateTextNode(elementvalue))
		    end if
		    SavePrefs
		  else
		    nl=MyPrefs.Xql("kastal")
		    if nl.Length>0 then
		      n=nl.Item(0).AppendChild(MyPrefs.CreateElement(elementname))
		      n.AppendChild(MyPrefs.CreateTextNode(elementvalue))
		      SavePrefs
		    end if
		  end if
		  
		  
		  Exception //ex as XmlException
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetPrefsValue(elementname As String, elementvalue As String) As Boolean
		  dim n As XmlNode
		  dim nl As XmlNodeList
		  
		  if elementname.len=0 or elementvalue.len=0 then
		    'MsgBox "Can not set prefs, the element name or value was empty."
		    Return false
		  end if
		  
		  'if prefsXML=nil then
		  'if not InnitiatePrefs then
		  ''MsgBox "Could not innitiate prefs."
		  'Return false
		  'end if
		  'end if
		  
		  //find the element (if it exists)
		  nl=MyPrefs.Xql("//"+elementname)
		  if nl.Length>0 then
		    n=nl.Item(0)
		    if n.ChildCount>0 then
		      n.child(0).Value=elementvalue
		    else
		      n.AppendChild(MyPrefs.CreateTextNode(elementvalue))
		    end if
		    SavePrefs
		    Return True
		  else
		    nl=MyPrefs.Xql("kastal")
		    if nl.Length>0 then
		      n=nl.Item(0).AppendChild(MyPrefs.CreateElement(elementname))
		      n.AppendChild(MyPrefs.CreateTextNode(elementvalue))
		      SavePrefs
		      Return True
		    else
		      Return False
		    end if
		  end if
		  
		  
		  Exception //ex as XmlException
		    
		    'If ex IsA XmlException then
		    'MsgBox "XmlException"
		    'Return False
		    'elseif ex IsA NilObjectException then
		    'MsgBox "Nil Object Exception"
		    'Return False
		    'elseif ex IsA OutOfBoundsException then
		    'MsgBox "Out of Bounds"
		    'Return False
		    'elseif ex IsA TypeMismatchException then
		    'MsgBox "Type Mismatch"
		    'Return False
		    'End if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub spit404(Res As WebResponse)
		  Res.Status=404
		  Res.Header("Content-Type") = "text/html"
		  Res.Header("Content-Description") =""
		  Res.Header("Content-Disposition") =""
		  Res.Write "<html><body><h1>404 - File Not Found</h1><hr><p><i> kastal "+Str(App.MajorVersion)+"-"+Str(App.MinorVersion)+"-"+Str(App.BugVersion)+" b"+str(app.NonReleaseVersion)+"</i></p></body></html>"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function spitFile206(res as webresponse, f as folderitem, range as string, name as string) As Boolean
		  Var spitStart, SpitEnd, spit, filesize As integer
		  
		  spitStart=0
		  SpitEnd=1024 //We default to deliver 1 kb
		  filesize=f.Length
		  
		  if range<>"" then
		    
		    Var r(-1) As String
		    r=range.ToArray("-")
		    
		    if r(0)<>"" then
		      spitStart=r(0).ToInteger
		    end if
		    
		    if r(1)<>"" then
		      spitEnd=r(1).ToInteger
		    else
		      SpitEnd=spitStart+1048576
		    end if
		    
		  end if
		  
		  //We limit each chunk of spit to max 1 mb
		  if spitEnd>(spitStart+1048576) then
		    spitend=spitStart+1048576
		  end if
		  
		  //We adjust for first byte having the address of 0 and last byte having the address of filelength-1
		  if spitend>=filesize then
		    spitend=filesize-1
		  end if
		  
		  //Sanity check
		  if spitStart>spitEnd then
		    res.Status=416 //Return unsatisfiable range
		    res.Header("Content-Type") = echoMimeType(f.Name)
		    res.Header("Accept-Ranges")="bytes"
		    res.Write("")
		    return true
		  end if
		  
		  res.Status=206 //Partial content
		  res.Header("Accept-Ranges")="bytes"
		  'Response.Header("Content-Length")=str(spitEnd-spitStart) //Set automatically
		  res.Header("Content-Range")="bytes "+Str(spitStart)+"-"+Str(spitEnd)+"/"+str(filesize)
		  res.Header("Content-Type") = echoMimeType(f.Name)
		  res.Header("Cache-control") = "max-age=2592000" // 30days
		  res.Header("Content-Description") = name
		  res.Header("Content-Disposition") ="inline"
		  
		  //We adjust spit by +1 byte so that range=x-x actually delivers byte x.
		  spit =spitEnd-spitStart+1
		  
		  Var ReadStream As BinaryStream = BinaryStream.Open(f, False)
		  readStream.BytePosition=spitStart
		  res.Write(ReadStream.Read(spit))
		  return True
		  
		  Exception
		    return false
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		myBasePath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MyDB As SQLiteDatabase = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MyDBFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		MyPrefs As XMLDocument = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MyPrefsFile As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MyScan4MoviesThread As Scan4MoviesThread = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MyScan4TunesThread As Scan4TunesThread = nil
	#tag EndProperty


	#tag Constant, Name = kEmailVerificationCode, Type = String, Dynamic = True, Default = \"Email Verification Code", Scope = Public
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Epostverifieringskod"
	#tag EndConstant

	#tag Constant, Name = kEmailVerificationCodeIs, Type = String, Dynamic = True, Default = \"Your verification code is:", Scope = Public
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Din verifieringskod \xC3\xA4r:"
	#tag EndConstant

	#tag Constant, Name = kSlt, Type = String, Dynamic = False, Default = \"pau9!#emS82vp%", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MovieHTML, Type = String, Dynamic = False, Default = \"<!DOCTYPE html> \n<html> \n<body> \n\n<video width\x3D\"320\" height\x3D\"180\" controls autoplay>\n  <source src\x3D\"XXX\" type\x3D\"video/mp4\">\n  Your browser does not support HTML video.\n</video>\n\n</body> \n</html>", Scope = Public
	#tag EndConstant


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
			InitialValue="-2147483648"
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
			Name="myBasePath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
