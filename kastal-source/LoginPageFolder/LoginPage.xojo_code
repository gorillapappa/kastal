#tag WebPage
Begin WebPage LoginPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   False
   Height          =   448
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   250
   PanelIndex      =   0
   ScaleFactor     =   0.0
   TabIndex        =   0
   Title           =   "kastal | Log In"
   Top             =   0
   Visible         =   True
   Width           =   300
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebRectangle Rectangle3
      BackgroundColor =   &cF9F3D200
      BorderColor     =   &c000000FF
      BorderThickness =   1
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   363
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   56
      Visible         =   True
      Width           =   300
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
   Begin WebRectangle Rectangle2
      BackgroundColor =   &cFFFFFF
      BorderColor     =   &c000000FF
      BorderThickness =   1
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   10
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   346
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   65
      Visible         =   True
      Width           =   300
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel fieldLbl1
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   False
         FontName        =   ""
         FontSize        =   14.0
         Height          =   58
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   50
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   False
         Multiline       =   True
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "Dont have an account?"
         TextAlignment   =   2
         TextColor       =   &c0433FF00
         Tooltip         =   ""
         Top             =   305
         Underline       =   True
         Visible         =   False
         Width           =   200
         _mPanelIndex    =   -1
      End
      Begin myInputFld emailFld
         AllowAutoComplete=   False
         AllowSpellChecking=   False
         Caption         =   "Email"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FieldType       =   2
         Height          =   52
         Hint            =   ""
         Index           =   -2147483648
         Indicator       =   0
         Left            =   50
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         Tooltip         =   ""
         Top             =   85
         Visible         =   True
         Width           =   200
         _mPanelIndex    =   -1
      End
      Begin myInputFld pwFld
         AllowAutoComplete=   False
         AllowSpellChecking=   False
         Caption         =   "Password"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FieldType       =   1
         Height          =   52
         Hint            =   ""
         Index           =   -2147483648
         Indicator       =   0
         Left            =   50
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         MaximumCharactersAllowed=   0
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         Tooltip         =   ""
         Top             =   145
         Visible         =   True
         Width           =   200
         _mPanelIndex    =   -1
      End
      Begin WebCheckbox RememberCBox
         Caption         =   "Remember Me"
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   31
         Indeterminate   =   False
         Index           =   -2147483648
         Indicator       =   0
         Left            =   50
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   "0"
         TabStop         =   True
         Tooltip         =   ""
         Top             =   266
         Value           =   False
         Visible         =   True
         Width           =   200
         _mPanelIndex    =   -1
      End
      Begin WebButton loginBtn
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "Login"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   True
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   1
         Left            =   50
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   False
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   "0"
         TabStop         =   True
         Tooltip         =   ""
         Top             =   220
         Visible         =   True
         Width           =   200
         _mPanelIndex    =   -1
      End
      Begin WebLabel forgotBtn
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   False
         FontName        =   ""
         FontSize        =   11.0
         Height          =   28
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   50
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   False
         Multiline       =   True
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "Forgot Your Password?"
         TextAlignment   =   2
         TextColor       =   &c0433FF00
         Tooltip         =   ""
         Top             =   344
         Underline       =   True
         Visible         =   False
         Width           =   200
         _mPanelIndex    =   -1
      End
   End
   Begin WebRectangle Rectangle1
      BackgroundColor =   &c42424200
      BorderColor     =   &c000000FF
      BorderThickness =   0
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   56
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   300
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel loginLbl
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   14.0
         Height          =   56
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "kastal | Log In"
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   1
         Underline       =   False
         Visible         =   True
         Width           =   260
         _mPanelIndex    =   -1
      End
   End
   Begin WebRectangle AccountFooter
      BackgroundColor =   &c42424200
      BorderColor     =   &c000000FF
      BorderThickness =   0
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   30
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   418
      Visible         =   True
      Width           =   300
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel loginLbl1
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   10.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "AccountFooter"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "AccountFooter"
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "©2024 xequator - All rights reserved"
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   419
         Underline       =   False
         Visible         =   True
         Width           =   260
         _mPanelIndex    =   -1
      End
   End
   Begin ResetPasswordDialog ResetPasswordDialog1
      ControlCount    =   0
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   386
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   -160
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Position        =   0
      Scope           =   0
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -16
      VerificationCounter=   0
      Visible         =   True
      Width           =   310
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  me.Style.FontSize=12
		  if GetPrefsValue("SMTPServer")<>"" then //We presume we can send out emails
		    forgotBtn.Visible=true
		    forgotBtn.enabled=true
		  end if
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events emailFld
	#tag Event
		Sub TextChanged()
		  loginBtn.enabled=true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events loginBtn
	#tag Event
		Sub Pressed()
		  if pwFld.text<>"" and emailFld.text<>"" then
		    //Find the user
		    Var rs As RowSet
		    Var saveME As Boolean = False
		    
		    //Check if this is tehe first user in the DB, if so add it as a sysadmin
		    Try
		      rs = MyDB.SelectSQL("SELECT * FROM tblUsers")
		      if rs.RowCount=0 then //No user in the DB
		        saveME=true
		      end if
		    end try
		    
		    if saveME=true then
		      //Here we store the innitialuser in the DB
		      Var d As DateTime = DateTime.Now
		      Try
		        MyDB.ExecuteSQL("INSERT INTO tblUsers (Email, creationDate, State, Password, FirstName, LastName) VALUES(?, ?, ?, ?, ?, ?)", emailFld.Text, d.SQLDateTime, 1000, PasswordHash(emailFld.Text+pwFld.text,512), "Innitial", "User")
		      Catch error As DatabaseException
		        MessageBox( "DB Error " + error.Message)
		        Return
		      End Try
		    end if
		    
		    
		    Try
		      rs = MyDB.SelectSQL("SELECT userID, State FROM tblUsers WHERE State > 0 AND Email = ? AND Password = ?", emailFld.text, PasswordHash(emailFld.text+pwFld.text, 512))
		      if rs.RowCount=1 then
		        rs.MoveToFirstRow
		        Session.myUserID=rs.Column("userID").IntegerValue
		        Session.myState=rs.Column("State").IntegerValue
		        
		        if Session.myState<50 then
		          MessageBox("You have an account, but you do not have priviliges to log in"+EndOfLine+"Please contact the system administrator to bump your privileges")
		        else
		          Session.kastalPage=new TunesPage
		          session.kastalPage.show
		          
		          
		          //Allow content
		          '#if DebugBuild
		          'Session.Cookies.Set("kastalc0nt3ntc00k13", "go")
		          '#else
		          'Session.Cookies.Set("kastalc0nt3ntc00k13", "go",Nil, Session.Header("Host"), "", True)   ' this sets secure mode cookie
		          '#endif
		          
		          //Remember me
		          if RememberCBox.Value=true then
		            
		            dim sql, c As String
		            c=PasswordHash(DateTime.Now.SQLDateTime+emailFld.Text,8)
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
		              MessageBox( "DB Error " + error.Message)
		            End Try
		            
		          end if
		          
		        end if
		        
		      else
		        MessageBox("Sorry, wrong credentials, please try again...")
		        emailFld.text=""
		        pwFld.text=""
		      end if
		      rs.Close
		    Catch error As DatabaseException
		      MessageBox("DB error: " + error.Message)
		      Return
		    End Try
		  else
		    MessageBox("Please fill in Username and Password")
		  end 
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events forgotBtn
	#tag Event
		Sub Pressed()
		  if emailFld.Text <> "" then
		    //First we check that the user (email) does exist
		    Var rs As RowSet
		    Try
		      rs = MyDB.SelectSQL("SELECT Email FROM tblUsers WHERE Email = ?", emailFld.Text)
		      if rs.RowCount=1 then
		        
		        
		        session.EmailVerificationCode=System.Random.InRange(100000, 999999)
		        
		        SendEmail(emailFld.Text, "kastal password reset request", "Your reset password code is: "+str(Session.EmailVerificationCode), "<h2>Your reset password code is: </h2><h1>"+str(Session.EmailVerificationCode)+"</h1>")
		        
		        ResetPasswordDialog1.Description.Text=ResetPasswordDialog1.Description.Text.Replace("XXX", emailFld.Text)
		        ResetPasswordDialog1.Show
		        
		      else //Email does not exist
		        
		        MessageBox("The email addres you entered is not signed up as a user.")
		        
		      end if
		      rs.Close
		    Catch error As DatabaseException
		      MessageBox("DB error: " + error.Message)
		      Return
		    End Try
		    
		  else
		    MessageBox("Please type in your email address.")
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="ScaleFactor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
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
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
