#tag Class
Protected Class MusicDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function BuildQuery(sortColumns as String, forCount as boolean) As String
		  Var sql As String = "SELECT tblTunes.TuneID AS TuneID, tblTunes.Band AS Band , tblTunes.Album AS Album, tblTunes.Year AS Year, tblTunes.Title AS Title, tblTunes.Location AS Location FROM tblTunes"
		  If forCount Then
		    sql = "SELECT Count(*) AS c FROM tblTunes"
		  End If
		  
		  'sql1 = Session.kastalPage.MyMusicContainer.LibraryPopupMenu.RowTagAt(Session.kastalPage.MyMusicContainer.LibraryPopupMenu.SelectedRowIndex)
		  
		  if Session.PlaylistSQL<>"" then
		    sql=sql+Session.PlaylistSQL
		  end if
		  
		  If filter <> ""  Then
		    
		    if Session.PlaylistSQL="" then
		      sql=sql+" WHERE"
		    else
		      sql=sql+" AND"
		    end if
		    
		    select case Session.what
		    case 0
		      sql = sql + " (Band LIKE ? OR Album LIKE ? OR Title LIKE ?)"
		    case 1
		      sql = sql + " Band LIKE ?"
		    case 2
		      sql = sql + " Album LIKE ?"
		    case 3
		      sql = sql + " Title LIKE ?"
		    end select
		  end if
		  
		  'If sortColumns <> "" Then
		  sql = sql + " ORDER BY Band, Album, Title"// COLLATE NORMALIZE"// + sortColumns
		  'End If
		  
		  Return sql
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "Band" // the name of the field in your database or data source (Required)
		  col.Heading = "Tune" // the name that appears above the column in the header
		  col.Sortable = True // Whether or not the column is sortable
		  col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "*" // Width of the column. Pixels, Percentage or *
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "More" // the name of the field in your database or data source (Required)
		  col.Heading = "More" // the name that appears above the column in the header
		  col.Sortable = True // Whether or not the column is sortable
		  col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "30" // Width of the column. Pixels, Percentage or *
		  cols.Add(col)
		  
		  Return cols
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Try
		    db = New SQLiteDatabase
		    db.DatabaseFile = MyDBFile
		    db.Connect
		    
		  Catch ex As DatabaseException
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetPrimaryKeysCache()
		  mSortedKeys.RemoveAll
		  mUnsortedKeys.RemoveAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  // Typically you would ask your data source how many rows are in the current query
		  // If you're applying a filter of some sort, you should apply it here too.
		  
		  Try
		    Var sql As String = BuildQuery("", true)
		    Var rs As RowSet
		    If filter = "" Then
		      rs = db.SelectSQL(sql)
		    Else
		      if Session.what>0 then
		        rs = db.SelectSQL(sql, "%" + filter + "%")
		      else
		        rs = db.SelectSQL(sql, "%" + filter + "%", "%" + filter + "%", "%" + filter + "%")
		      end if
		    End If
		    
		    Var c As Integer = rs.Column("c").IntegerValue
		    rs.Close
		    Return c
		  Catch ex As DatabaseException
		    
		  End Try
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(row as integer) As String()
		  Var sql As String = BuildQuery(mLastSortColumns, False)
		  sql = sql + " LIMIT 1 OFFSET " + Str(row)
		  
		  Var rs as RowSet
		  If filter = "" Then
		    rs = db.SelectSQL(sql)
		  Else
		    if Session.what>0 then
		      rs = db.SelectSQL(sql, "%" + filter + "%")
		    else
		      if Session.what>0 then
		        rs = db.SelectSQL(sql, "%" + filter + "%")
		      else
		        rs = db.SelectSQL(sql, "%" + filter + "%", "%" + filter + "%", "%" + filter + "%")
		      end if
		    end if
		  End If
		  
		  Dim datum() As String
		  If Not rs.AfterLastRow then
		    datum.Add rs.Column("Tune").StringValue
		  End If
		  rs.Close
		  
		  Return datum
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  // Returns the requested data
		  // This method may fire multiple times, but you must only return at maximum the number of items it requests.
		  // RowCount = how many rows it wants. In SQL this is expressed as "LIMIT N"
		  // RowOffset = the offset from the beginning of the dataset. In SQL this is expressed as "OFFSET N"
		  // SortColumns = this is a SQL string that indicates the columns and their sort order. This is why you put in the DatabaseFieldName when defining columns
		  
		  // store the current sort so we can use it in the other RowData method later
		  mLastSortColumns = SortColumns
		  
		  Var rows() As WebListboxRowData
		  
		  Try
		    Var edit As string
		    Var sql As String = BuildQuery(SortColumns, False)
		    sql = sql + " LIMIT " + Str(RowCount) + " OFFSET " + Str(RowOffset)
		    
		    Var rs As RowSet
		    
		    if Session.kastalPage.MyMusicContainer.LibraryPopupMenu.SelectedRowIndex>0 then
		      edit="➖"
		    else
		      edit="✴️"
		    end if
		    
		    If filter = "" Then //Whole library
		      
		      rs = db.SelectSQL(sql)
		    Else
		      
		      if Session.what>0 then
		        rs = db.SelectSQL(sql, "%" + filter + "%")
		      else
		        rs = db.SelectSQL(sql, "%" + filter + "%", "%" + filter + "%", "%" + filter + "%")
		      end if
		    End If
		    
		    Var y As String
		    While Not rs.AfterLastRow
		      
		      if rs.Column("Year").StringValue.ToInteger > 0 then
		        y=" ("+rs.Column("Year").StringValue+")"
		      else 
		        y=""
		      end if
		      
		      Var row As New WebListBoxRowData
		      row.PrimaryKey = rs.Column("TuneID").IntegerValue
		      row.Value("Band") = "<h3 style=""margin:0 10 0 10;"">"+rs.Column("Title").StringValue+"</h3><p style=""margin:0 10 0 10;"">💿 "+rs.Column("Album").StringValue+y+"<br>🎭 "+rs.Column("Band").StringValue+"</p>"//rs.Column("Band").StringValue
		      
		      row.Value("More") = "<h3 style=""margin:10px;"">"+edit+"</h3>"//<p style=""margin:10px;"">💿 "+rs.Column("Album").StringValue+"<br>🎭 "+rs.Column("Band").StringValue+"</p>"//rs.Column("Band").StringValue
		      
		      row.Tag=rs.Column("TuneID").StringValue
		      rows.Add(row)
		      
		      rs.MoveToNextRow
		    Wend
		    rs.Close
		    
		    Return rows
		  Catch ex As DatabaseException
		    Break
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  // This method is used for maintaining the selected rows list on the client
		  
		  Static lastSortOrder as string = ""
		  Static lastFilter As String = ""
		  
		  // If the sort order has changed, reset the array so the data is re-pulled
		  If lastSortOrder <> sortColumns Or lastFilter<> Filter Then
		    lastSortOrder = sortColumns
		    lastFilter = filter
		    Redim mSortedKeys(-1)
		  End If
		  
		  // We will be using a cache in this example. It is not required, but if
		  // you do cache the results, you will need to have a way to invalidate it.
		  //
		  // Using a method like ResetPrimaryKeysCache(), whenever you add or remove
		  // rows, which simply clears the array, will ensure that RowTagAt() will
		  // work properly.
		  If mSortedKeys = Nil Or mSortedKeys.LastIndex = -1 Then
		    Var sql As String = BuildQuery(sortColumns, False)
		    
		    Var keys() As Integer
		    
		    Var rs As RowSet
		    
		    If filter = "" Then
		      rs = db.SelectSQL(sql)
		    Else
		      if Session.what>0 then
		        rs = db.SelectSQL(sql, "%" + filter + "%")
		      else
		        rs = db.SelectSQL(sql, "%" + filter + "%", "%" + filter + "%", "%" + filter + "%")
		      end if
		    End If
		    
		    While Not rs.AfterLastRow
		      keys.Add(rs.Column("TuneID").IntegerValue)
		      rs.MoveToNextRow
		    Wend
		    
		    rs.Close
		    
		    mSortedKeys = keys
		  End If
		  
		  Return mSortedKeys
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  // This method is used for maintaining the selected rows list on the client
		  
		  Static lastFilter As String = ""
		  
		  // If the sort order has changed, reset the array so the data is re-pulled
		  If lastFilter<> Filter Then
		    lastFilter = filter
		    Redim mUnsortedKeys(-1)
		  End If
		  
		  // We will be using a cache in this example. It is not required, but if
		  // you do cache the results, you will need to have a way to invalidate it.
		  //
		  // Using a method like ResetPrimaryKeysCache(), whenever you add or remove
		  // rows, which simply clears the array, will ensure that RowTagAt() will
		  // work properly.
		  If mUnsortedKeys = Nil Or mUnsortedKeys.LastIndex = -1 Then
		    Var sql As String = BuildQuery("", False)
		    
		    Var keys() As Integer
		    
		    Var rs As RowSet
		    
		    If filter = "" Then
		      rs = db.SelectSQL(sql)
		    Else
		      if Session.what>0 then
		        rs = db.SelectSQL(sql, "%" + filter + "%")
		      else
		        rs = db.SelectSQL(sql, "%" + filter + "%", "%" + filter + "%", "%" + filter + "%")
		      end if
		    End If
		    
		    While Not rs.AfterLastRow
		      keys.Add(rs.Column("TuneID").IntegerValue)
		      rs.MoveToNextRow
		    Wend
		    
		    rs.Close
		    
		    mUnsortedKeys = keys
		  End If
		  
		  return mUnsortedKeys
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		Filter As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastSortColumns As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSortedKeys() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUnsortedKeys() As Integer
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
			Name="Filter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
