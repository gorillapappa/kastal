#tag WebContainerControl
Begin WebContainer MusicContainer
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   540
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   482
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebRectangle Rectangle2
      BackgroundColor =   &c42424200
      BorderColor     =   &c818C7800
      BorderThickness =   0
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   54
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
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
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   53
      Visible         =   True
      Width           =   482
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebSearchField SearchField1
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   38
         Hint            =   "Search"
         Index           =   -2147483648
         Indicator       =   0
         Left            =   125
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   "-1"
         TabStop         =   True
         Text            =   ""
         Tooltip         =   ""
         Top             =   54
         Visible         =   True
         Width           =   285
         _mPanelIndex    =   -1
      End
      Begin myPopup SearchPopupMenu
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialValue    =   "All\nBand\nAlbum\nTitle"
         LastAddedRowIndex=   0
         LastRowIndex    =   0
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         RowCount        =   0
         Scope           =   0
         SelectedRowIndex=   0
         SelectedRowText =   ""
         TabIndex        =   2
         TabPanelIndex   =   "-1"
         TabStop         =   True
         Tooltip         =   ""
         Top             =   54
         Visible         =   True
         Width           =   97
         _mPanelIndex    =   -1
      End
      Begin WebLabel addtoplaylistBtn1
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   24.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   432
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "↩️"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   58
         Underline       =   False
         Visible         =   True
         Width           =   30
         _mPanelIndex    =   -1
      End
   End
   Begin WebRectangle Rectangle1
      BackgroundColor =   &c42424200
      BorderColor     =   &c818C7800
      BorderThickness =   0
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   84
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
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   457
      Visible         =   True
      Width           =   482
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel TuneTxt
         Bold            =   True
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   14.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   ""
         Italic          =   False
         Left            =   51
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   457
         Underline       =   False
         Visible         =   True
         Width           =   373
         _mPanelIndex    =   -1
      End
      Begin WebLabel addtoplaylistBtn
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   False
         FontName        =   ""
         FontSize        =   24.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   432
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   False
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
         Text            =   "✴️"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   467
         Underline       =   False
         Visible         =   True
         Width           =   30
         _mPanelIndex    =   -1
      End
      Begin WebLabel PlayNext
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   24.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   432
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "⏩️"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   505
         Underline       =   False
         Visible         =   True
         Width           =   30
         _mPanelIndex    =   -1
      End
      Begin WebAudioPlayer TunePlayer
         AllowAutoPlay   =   True
         AllowLooping    =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Duration        =   0.0
         Enabled         =   True
         HasController   =   True
         Height          =   40
         Index           =   -2147483648
         Indicator       =   0
         Left            =   68
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Position        =   0.0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   "-1"
         TabStop         =   True
         Tooltip         =   ""
         Top             =   500
         URL             =   ""
         Visible         =   True
         Width           =   342
         _mPanelIndex    =   -1
      End
      Begin WebLabel PlayNext1
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   24.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "⏪️"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   505
         Underline       =   False
         Visible         =   True
         Width           =   30
         _mPanelIndex    =   -1
      End
      Begin WebLabel BandTxt
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   12.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   51
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         TabIndex        =   17
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   474
         Underline       =   False
         Visible         =   True
         Width           =   373
         _mPanelIndex    =   -1
      End
   End
   Begin WebListBox TunesListBox
      AllowRowReordering=   False
      ColumnCount     =   1
      ColumnWidths    =   "*"
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   74
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   350
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   "No tunes found"
      PanelIndex      =   0
      Parent          =   "TabPanel1"
      ProcessingMessage=   "Loading tunes..."
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &cEFBC9B00
      SelectedRowIndex=   0
      TabIndex        =   2
      TabPanelIndex   =   "-1"
      TabStop         =   True
      Tooltip         =   ""
      Top             =   107
      Visible         =   True
      Width           =   482
      _mPanelIndex    =   -1
   End
   Begin WebRectangle Rectangle3
      BackgroundColor =   &c42424200
      BorderColor     =   &c818C7800
      BorderThickness =   0
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   54
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
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
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   482
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin myPopup LibraryPopupMenu
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialValue    =   ""
         LastAddedRowIndex=   0
         LastRowIndex    =   0
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "Rectangle3"
         RowCount        =   0
         Scope           =   0
         SelectedRowIndex=   0
         SelectedRowText =   ""
         TabIndex        =   11
         TabPanelIndex   =   "-1"
         TabStop         =   True
         Tooltip         =   ""
         Top             =   1
         Visible         =   True
         Width           =   389
         _mPanelIndex    =   -1
      End
      Begin WebLabel addtoplaylistBtn2
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   24.0
         Height          =   30
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   432
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "Rectangle3"
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   "0"
         TabStop         =   True
         Text            =   "🆕"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   4
         Underline       =   False
         Visible         =   True
         Width           =   30
         _mPanelIndex    =   -1
      End
   End
   Begin PlayListDialog PlayListDialog1
      ControlCount    =   0
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
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
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   346
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
   Begin addtoPlayListDialog addtoPlayListDialog1
      ControlCount    =   0
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   450
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
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
      TabIndex        =   14
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   346
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ListLibraries
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ListLibraries()
		  LibraryPopupMenu.RemoveAllRows
		  
		  LibraryPopupMenu.AddRow("🎼 Whole Music Library")
		  LibraryPopupMenu.RowTagAt(LibraryPopupMenu.LastAddedRowIndex) = ""
		  LibraryPopupMenu.SelectedRowIndex=0
		  
		  Var rs as RowSet
		  
		  rs = MyDB.SelectSQL("SELECT * FROM tblPlaylists WHERE user_ID = "+Session.myUserID.ToString+" OR Type > 9")
		  For Each row As DatabaseRow In rs
		    LibraryPopupMenu.AddRow("🎶 "+row.Column("playlistName").StringValue)
		    LibraryPopupMenu.RowTagAt(LibraryPopupMenu.LastAddedRowIndex) = ", tblPlaylistTunes WHERE tblPlaylistTunes.playlist_ID = "+row.Column("playlistID").StringValue+" AND tblTunes.TuneID = tblPlaylistTunes.tune_ID "
		    LibraryPopupMenu.RowTagAt(LibraryPopupMenu.LastAddedRowIndex) = row.Column("playlistID").StringValue
		    
		    LibraryPopupMenu.SelectedRowIndex=0
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		PlayMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Playrandom As boolean = false
	#tag EndProperty


#tag EndWindowCode

#tag Events SearchField1
	#tag Event
		Sub TextChanged()
		  MusicDataSource(TunesListBox.DataSource).Filter = SearchField1.Text
		  TunesListBox.ReloadData
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SearchPopupMenu
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  SearchField1.SetFocus
		  Session.what=me.SelectedRowIndex
		  TunesListBox.ReloadData
		  TunesListBox.SelectedRowIndex=-1
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events addtoplaylistBtn1
	#tag Event
		Sub Pressed()
		  if PlayMode>2 then
		    PlayMode=0
		  else
		    PlayMode=PlayMode+1
		  end if
		  
		  TunePlayer.AllowLooping=false
		  
		  Select Case PlayMode
		  case 0 //Play playlist to end
		    
		    me.Text="↩️"
		    
		  case 1 //Loop Playlist
		    
		    me.Text="🔁"
		    
		  case 2 //Loop current song
		    
		    me.Text="🔂"
		    TunePlayer.AllowLooping=true
		    
		  else //3 Play Random
		    
		    me.Text="🔀"
		    
		    Var tuneID As String
		    Var rnd As integer
		    
		    rnd=System.Random.InRange(0, TunesListBox.LastRowIndex)
		    TunesListBox.ScrollTo(rnd)
		    TunesListBox.SelectedRowIndex=rnd
		    tuneID=TunesListBox.RowTagAt(rnd).StringValue
		    
		    #if  DebugBuild then
		      TunePlayer.url="http://"+Session.Host+myBasePath+"?sid="+Session.Identifier+"&gimmie=datune&id="+tuneID
		    #else
		      TunePlayer.url="https://"+Session.Host+myBasePath+"?sid="+Session.Identifier+"&gimmie=datune&id="+tuneID
		    #endif
		    
		  end select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events addtoplaylistBtn
	#tag Event
		Sub Pressed()
		  addtoPlayListDialog1.show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayNext
	#tag Event
		Sub Pressed()
		  TunePlayer.Position=TunePlayer.Duration-0.3
		  TunePlayer.play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TunePlayer
	#tag Event
		Sub PlaybackEnded()
		  Var tuneID As String
		  
		  Select Case PlayMode
		  Case 0
		    
		    If TunesListBox.LastRowIndex>TunesListBox.SelectedRowIndex Then
		      
		      TunesListBox.SelectedRowIndex=TunesListBox.SelectedRowIndex+1
		      tuneID=TunesListBox.RowTagAt(TunesListBox.SelectedRowIndex).StringValue
		      
		    Else
		      
		      tuneID=""
		      
		    End If
		    
		  Case 1
		    
		    If TunesListBox.LastRowIndex>TunesListBox.SelectedRowIndex Then
		      
		      TunesListBox.SelectedRowIndex=TunesListBox.SelectedRowIndex+1
		      tuneID=TunesListBox.RowTagAt(TunesListBox.SelectedRowIndex).StringValue
		      
		    Else
		      
		      TunesListBox.SelectedRowIndex=0
		      tuneID=TunesListBox.RowTagAt(TunesListBox.SelectedRowIndex).StringValue
		      
		    End If
		    
		  Case 3
		    
		    Var Rnd As Integer
		    
		    Rnd=System.Random.InRange(0, TunesListBox.LastRowIndex)
		    TunesListBox.SelectedRowIndex=Rnd
		    TunesListBox.ScrollTo(Rnd)//TunesListBox.SelectedRowIndex)
		    tuneID=TunesListBox.RowTagAt(Rnd).StringValue
		    
		  End Select
		  
		  If tuneID<>"" Then
		    #If  DebugBuild Then
		      TunePlayer.url="http://"+Session.Host+myBasePath+"?sid="+Session.Identifier+"&gimmie=datune&id="+tuneID
		    #Else
		      TunePlayer.url="https://"+Session.Host+myBasePath+"?sid="+Session.Identifier+"&gimmie=datune&id="+tuneID
		    #EndIf
		    
		    TunePlayer.Play
		  End If
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.AllowAutoPlay=true
		  Me.Style.Value("height") =  "40px"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayNext1
	#tag Event
		Sub Pressed()
		  MessageBox("Sorry, not implemented yet...")
		  'TunePlayer.Position=TunePlayer.Duration-0.5
		  'TunePlayer.play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TunesListBox
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  if me.SelectedRowIndex=-1 then
		    
		    addtoplaylistBtn.enabled=false
		    
		  else
		    
		    Var rs As RowSet
		    Try
		      rs = MyDB.SelectSQL("SELECT Title, Band FROM tblTunes WHERE TuneID = ?", me.RowTagAt(me.SelectedRowIndex).StringValue)
		    end Try
		    For Each row As DatabaseRow In rs
		      TuneTxt.Text=row.Column("Title").StringValue
		      BandTxt.Text=row.Column("Band").StringValue
		    Next
		    
		    addtoplaylistBtn.enabled=true
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.DataSource = new MusicDataSource
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(row As Integer, column As Integer)
		  
		  if column > 0 then
		    if LibraryPopupMenu.SelectedRowIndex>0 then//remove from playlist
		      
		      removeTunefromPlaylist(me.RowTagAt(row), LibraryPopupMenu.RowTagAt(LibraryPopupMenu.SelectedRowIndex))
		      //Reload
		      me.SelectedRowIndex=-1
		      MusicDataSource(TunesListBox.DataSource).Filter = SearchField1.Text
		      TunesListBox.ReloadData
		      
		    else //add to playlist
		      addtoPlayListDialog1.show
		      
		    end if
		  else //Play Song
		    
		    Var tuneID As String
		    tuneID=TunesListBox.RowTagAt(row).StringValue
		    
		    #if  DebugBuild then
		      TunePlayer.url="http://"+Session.Host+myBasePath+"?sid="+Session.Identifier+"&gimmie=datune&id="+tuneID
		    #else
		      TunePlayer.url="https://"+Session.Host+myBasePath+"?sid="+Session.Identifier+"&gimmie=datune&id="+tuneID
		    #endif
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LibraryPopupMenu
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  
		  TunesListBox.SetFocus
		  if me.SelectedRowIndex>0 then
		    Session.PlaylistSQL = ", tblPlaylistTunes WHERE tblPlaylistTunes.playlist_ID = "+me.RowTagAt(me.SelectedRowIndex).StringValue+" AND tblTunes.TuneID = tblPlaylistTunes.tune_ID"
		  else
		    Session.PlaylistSQL=""
		  end if
		  
		  MusicDataSource(TunesListBox.DataSource).Filter = SearchField1.Text
		  TunesListBox.ReloadData
		  
		  TunesListBox.SelectedRowIndex=-1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events addtoplaylistBtn2
	#tag Event
		Sub Pressed()
		  PlayListDialog1.show
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
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
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
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="Visible"
		Visible=true
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
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
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
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
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
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Playrandom"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PlayMode"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
