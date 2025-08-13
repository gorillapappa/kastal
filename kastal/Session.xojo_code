#tag Class
Protected Class Session
Inherits WebSession
#tag Session
  interruptmessage=We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect.
  disconnectmessage=You have been disconnected from this application.
  confirmmessage=
  AllowTabOrderWrap=True
  ColorMode=0
  SendEventsInBatches=False
#tag EndSession
	#tag Event
		Sub Opening()
		  Session.Host=Session.Header("Host")
		  
		  Var c As String
		  c=self.Cookies.Value("c00k13")
		  
		  if c<>"" then
		    Var rs As RowSet
		    Try
		      rs = MyDB.SelectSQL("SELECT userID, State FROM tblUsers WHERE State > 0 AND liCookie = ? ", c)
		      if rs.RowCount=1 then
		        rs.MoveToFirstRow
		        
		        session.myUserID=rs.Column("userID").IntegerValue
		        session.myState=rs.Column("State").IntegerValue
		        
		        //Renew the auto login cookie
		        dim sql As String
		        c=PasswordHash(DateTime.Now.SQLDateTime+rs.Column("userID").StringValue, 8)
		        #if DebugBuild
		          Session.Cookies.Set("c00k13", c, DateTime.Now.AddInterval(0,1,0,6))
		        #else
		          Session.Cookies.Set("c00k13", c, DateTime.Now.AddInterval(0,1,0,6), Session.Header("Host"), "", True)   ' this sets secure mode cookie
		        #endif
		        
		        //Now we store the cookie in the DB for the user
		        sql = "UPDATE tblUsers SET liCookie = ? WHERE userID = ?"
		        Try
		          MyDB.ExecuteSQL(sql, c, Session.myUserID)
		        Catch error As DatabaseException
		          'MessageBox( "DB Error " + error.Message)
		        End Try
		        
		        Session.kastalPage=new TunesPage
		        session.kastalPage.show
		        
		        //Allow content
		        '#if DebugBuild
		        'Session.Cookies.Set("kastalc0nt3ntc00k13", "go")
		        '#else
		        'Session.Cookies.Set("kastalc0nt3ntc00k13", "go",Nil, Session.Header("Host"), "", True)   ' this sets secure mode cookie
		        '#endif
		        
		        
		      end if
		      rs.Close
		    Catch error As DatabaseException
		      'MessageBox("DB error: " + error.Message)
		    End Try
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		EmailVerificationCode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Host As String
	#tag EndProperty

	#tag Property, Flags = &h0
		kastalPage As TunesPage = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		myState As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		myUserID As integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		MyWebFile As WebFile
	#tag EndProperty

	#tag Property, Flags = &h0
		PlaylistSQL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		State As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		what As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Hashtag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageRightToLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaleFactor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserTimeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_baseurl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue="You have been disconnected from this application."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InterruptionMessage"
			Visible=true
			Group="Behavior"
			InitialValue="We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_LastMessageTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabOrderWrap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmDisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Platform"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="WebSession.ColorModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Auto"
				"1 - Light"
				"2 - Dark"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserPrefersDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendEventsInBatches"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="myUserID"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="integer"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="State"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EmailVerificationCode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="myState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="what"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PlaylistSQL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
