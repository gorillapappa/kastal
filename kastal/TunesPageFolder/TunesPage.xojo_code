#tag WebPage
Begin WebPage TunesPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   False
   Height          =   400
   ImplicitInstance=   False
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
   MinimumWidth    =   300
   PanelIndex      =   0
   ScaleFactor     =   0.0
   TabIndex        =   0
   Title           =   "kastal"
   Top             =   0
   Visible         =   True
   Width           =   552
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin MovieDialog MovieDialog1
      ControlCount    =   0
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   126
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
      Top             =   0
      Visible         =   True
      Width           =   600
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
   Begin WebToolbar Toolbar1
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FullWidth       =   False
      Height          =   56
      Index           =   -2147483648
      Indicator       =   8
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Parent          =   "nil"
      Position        =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Title           =   ""
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   552
      _mPanelIndex    =   -1
   End
   Begin WebRectangle Rectangle1
      BackgroundColor =   &c42424200
      BorderColor     =   &c22222200
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
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
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
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   370
      Visible         =   True
      Width           =   552
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel Label4
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   10.0
         Height          =   30
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
         TabIndex        =   14
         TabPanelIndex   =   "-1"
         TabStop         =   True
         Text            =   "©2025 - xequator, all rights reserved"
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   370
         Underline       =   False
         Visible         =   True
         Width           =   512
         _mPanelIndex    =   -1
      End
   End
   Begin WebRectangle ContainerRectangle
      BackgroundColor =   &cF9F3D200
      BorderColor     =   &c000000FF
      BorderThickness =   1
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   10
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   316
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
      TabIndex        =   15
      TabStop         =   True
      Tooltip         =   ""
      Top             =   55
      Visible         =   True
      Width           =   552
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Shown()
		  if Session.kastalPage.MyMusicContainer=nil then
		    
		    Session.kastalPage.MyMusicContainer = New MusicContainer
		    Session.kastalPage.MyMusicContainer.LockTop = True
		    Session.kastalPage.MyMusicContainer.LockBottom = True
		    
		    Session.kastalPage.MyMusicContainer.LockLeft = true
		    Session.kastalPage.MyMusicContainer.LockRight = true
		    Session.kastalPage.MyMusicContainer.EmbedWithin(Session.kastalPage, 0, 56, Session.kastalPage.Width, Session.kastalPage.Height-86)//688)//Session.MyAccountPage.Height-60)
		    
		  else
		    Session.kastalPage.MyMusicContainer.Visible=True
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		MyAdminContainer As AdminContainer = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MyMovieContainer As MovieContainer = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MyMusicContainer As MusicContainer = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events Toolbar1
	#tag Event
		Sub Opening()
		  me.style.BackgroundColor = RGB(64,64,64)
		  me.style.ForegroundColor = Color.RGB(250,250,250)
		  
		  var btn As WebToolbarButton
		  
		  '// Flexible Space
		  'btn = New WebToolbarButton
		  'btn.Style = WebToolbarButton.ButtonStyles.FlexibleSpace
		  'me.AddItem(btn)
		  
		  // Music Button
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.Toggle
		  btn.Caption = "Music"
		  btn.Pressed=true
		  me.AddItem(btn)
		  
		  // Contact Button
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.Toggle
		  btn.Caption = "Movies"
		  me.AddItem(btn)
		  
		  if Session.myState>999 then
		    // Contact Button
		    btn = New WebToolbarButton
		    btn.Style = WebToolbarButton.ButtonStyles.Toggle
		    btn.Caption = "Admin"
		    me.AddItem(btn)
		  end if
		  
		  // Log out Button
		  btn = New WebToolbarButton
		  btn.Style = WebToolbarButton.ButtonStyles.Toggle
		  btn.Caption = "Log Out"
		  me.AddItem(btn)
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(item As WebToolbarButton)
		  
		  
		  //First we hide everything
		  if Session.kastalPage.MyMusicContainer<>nil then
		    Session.kastalPage.MyMusicContainer.Visible=False
		  end if
		  
		  if Session.kastalPage.MyMovieContainer<>nil then
		    Session.kastalPage.MyMovieContainer.Visible=False
		  end if
		  
		  if Session.kastalPage.MyAdminContainer<>nil then
		    Session.kastalPage.MyAdminContainer.Visible=false
		  end if
		  
		  select Case item.Caption
		    
		  case "Music"
		    if Session.kastalPage.MyMusicContainer=nil then
		      
		      Session.kastalPage.MyMusicContainer = New MusicContainer
		      Session.kastalPage.MyMusicContainer.LockTop = True
		      Session.kastalPage.MyMusicContainer.LockBottom = True
		      
		      Session.kastalPage.MyMusicContainer.LockLeft = true
		      Session.kastalPage.MyMusicContainer.LockRight = true
		      Session.kastalPage.MyMusicContainer.EmbedWithin(Session.kastalPage, 0, 56, Session.kastalPage.Width, Session.kastalPage.Height-86)//688)//Session.MyAccountPage.Height-60)
		      
		    else
		      Session.kastalPage.MyMusicContainer.Visible=True
		    end if
		    
		    
		  case "Movies"
		    if Session.kastalPage.MyMovieContainer=nil then
		      
		      Session.kastalPage.MyMovieContainer = New MovieContainer
		      Session.kastalPage.MyMovieContainer.LockTop = True
		      Session.kastalPage.MyMovieContainer.LockBottom = True
		      
		      Session.kastalPage.MyMovieContainer.LockLeft = true
		      Session.kastalPage.MyMovieContainer.LockRight = true
		      Session.kastalPage.MyMovieContainer.EmbedWithin(Session.kastalPage, 0, 56, Session.kastalPage.Width, Session.kastalPage.Height-86)//688)//Session.MyAccountPage.Height-60)
		      
		    else
		      Session.kastalPage.MyMovieContainer.Visible=True
		    end if
		    
		  case "Admin"
		    if Session.kastalPage.MyAdminContainer=nil then
		      
		      Session.kastalPage.MyAdminContainer = New AdminContainer
		      Session.kastalPage.MyAdminContainer.LockTop = True
		      Session.kastalPage.MyAdminContainer.LockBottom = false
		      
		      Session.kastalPage.MyAdminContainer.LockLeft = true
		      Session.kastalPage.MyAdminContainer.LockRight = true
		      Session.kastalPage.MyAdminContainer.EmbedWithin(Session.kastalPage, 0, 56, Session.kastalPage.Width, Session.kastalPage.Height-86)//688)//Session.MyAccountPage.Height-60)
		      
		    else
		      Session.kastalPage.MyAdminContainer.Visible=True
		    end if
		    
		    
		  case "Log Out"
		    //Clear the loginCookie in the DB for the user
		    Var sql As String
		    sql = "UPDATE tblUsers SET liCookie = ? WHERE userID = ?"
		    Try
		      MyDB.ExecuteSQL(sql, "", Session.myUserID)
		    Catch error As DatabaseException
		      MessageBox( "DB Error " + error.Message)
		    End Try
		    GoToURL(myBasePath)
		    
		  end Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label4
	#tag Event
		Sub Shown()
		  Var rs As RowSet
		  Try
		    rs = MyDB.SelectSQL("SELECT COUNT(*) AS c FROM tblTunes;")
		    For Each row As DatabaseRow In rs
		      me.Text="--- "+row.Column("c").StringValue+" Tunes & "
		    Next
		    rs.Close
		  Catch error As DatabaseException
		    MessageBox("Error: " + error.Message)
		  End Try
		  
		  Try
		    rs = MyDB.SelectSQL("SELECT COUNT(*) AS c FROM tblMovies;")
		    For Each row As DatabaseRow In rs
		      me.Text=Me.text+row.Column("c").StringValue+" Movies ---"
		    Next
		    rs.Close
		  Catch error As DatabaseException
		    MessageBox("Error: " + error.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
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
