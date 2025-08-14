#tag Class
Protected Class EKMediaFile
	#tag Method, Flags = &h0
		Sub Constructor(fi As FolderItem, enableAutoCorrect As Boolean = False)
		  // EKMediaFile ID3 Tag extraction in native Xojo code
		  // By Edward Kidwell
		  
		  Id3UserText = New Dictionary
		  enableAutoCorrectBadByteCounts = enableAutoCorrect
		  
		  // ZZZ = no 3-char tag exists where a 4-char tag DOES exist (i.e. simply fill the spot so the arrays are all the same size)
		  KnownId3v220Tags = Array("TT1","TT2","TT3","TP1","TP2","TP3","TP4","TCM","TXT","TLA","TCO","TAL","TRK", _
		  "TPA","TRC","TDA","TYE","TIM","TRD","ZZZ","TOR","ZZZ","TBP","TMT","TFT","TCR","TPB","TEN","TSS","TLE", _
		  "TSI","TDY","TKE","TOT","TOF","TOA","TOL","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ", _
		  "ZZZ","ZZZ","TXX","WAF","WAR","WAS","WCM","WCP","WPB","ZZZ","ZZZ","WXX","IPL","ZZZ","ZZZ","ULT","COM", _
		  "ZZZ","UFI","MCI","ETC","MLL","STC","SLT","RVA","ZZZ","EQU","ZZZ","REV","PIC","GEO","CNT","POP","BUF","CRM", _
		  "CRA","LNK","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ","ZZZ")
		  
		  KnownId3Tags = Array("TIT1","TIT2","TIT3","TPE1","TPE2","TPE3","TPE4","TCOM","TEXT","TLAN","TCON","TALB","TRCK", _
		  "TPOS","TSRC","TDAT","TYER","TIME","TRDA","TDRC","TORY","TDOR","TBPM","TMED","TFLT","TCOP","TPUB","TENC", _
		  "TSSE","TLEN","TSIZ","TDLY","TKEY","TOAL","TOFN","TOPE","TOLY","TOWN","TRSN","TRSO","TSST","TMOO","TPRO", _
		  "TDEN","TDRL","TDTG","TSOA","TSOP","TSOT","TXXX","WOAF","WOAR","WOAS","WCOM","WCOP","WPUB","WORS", _
		  "WPAY","WXXX","IPLS","TMCL","TIPL","USLT","COMM","USER","UFID","MCDI","ETCO","MLLT","SYTC","SYLT","RVAD", _
		  "RVA2","EQUA","EQU2","RVRB","APIC","GEOB","PCNT","POPM","RBUF","CRMX","AENC","LINK","POSS","COMR","ENCR", _
		  "GRID","PRIV","OWNE","SIGN","SEEK","ASPI")
		  
		  KnownId3TagsDesc = Array("CONTENTGROUP","TITLE","SUBTITLE","ARTIST","BAND","CONDUCTOR","MIXARTIST", _
		  "COMPOSER","LYRICIST","LANGUAGE","CONTENTTYPE","ALBUM","TRACKNUM","PARTINSET","ISRC","DATE", _
		  "YEAR","TIME","RECORDINGDATES","RECORDINGTIME","ORIGYEAR","ORIGRELEASETIME","BPM","MEDIATYPE", _
		  "FILETYPE","COPYRIGHT","PUBLISHER","ENCODEDBY","ENCODERSETTINGS","SONGLEN","SIZE","PLAYLISTDELAY", _
		  "INITIALKEY","ORIGALBUM","ORIGFILENAME","ORIGARTIST","ORIGLYRICIST","FILEOWNER","NETRADIOSTATION", _
		  "NETRADIOOWNER","SETSUBTITLE","MOOD","PRODUCEDNOTICE","ENCODINGTIME","RELEASETIME","TAGGINGTIME", _
		  "ALBUMSORTORDER","PERFORMERSORTORDER","TITLESORTORDER","USERTEXT","WWWAUDIOFILE","WWWARTIST", _
		  "WWWAUDIOSOURCE","WWWCOMMERCIALINFO","WWWCOPYRIGHT","WWWPUBLISHER","WWWRADIOPAGE", _
		  "WWWPAYMENT","WWWUSER","INVOLVEDPEOPLE","MUSICIANCREDITLIST","INVOLVEDPEOPLE2","UNSYNCEDLYRICS", _
		  "COMMENT","TERMSOFUSE","UNIQUEFILEID","CDID","EVENTTIMING","MPEGLOOKUP","SYNCEDTEMPO","SYNCEDLYRICS", _
		  "VOLUMEADJ","VOLUMEADJ2","EQUALIZATION","EQUALIZATION2","REVERB","PICTURE","GENERALOBJECT","PLAYCOUNTER", _
		  "POPULARIMETER","BUFFERSIZE","CRYPTEDMETA","AUDIOCRYPTO","LINKEDINFO","POSITIONSYNC","COMMERCIAL", _
		  "CRYPTOREG","GROUPINGREG","PRIVATE","OWNERSHIP","SIGNATURE","SEEKFRAME","AUDIOSEEKPOINT")
		  
		  KnownId3TagsComments = Array("content group description","title/songname/content description","subtitle/description refinement", _
		  "lead performer(s)/soloist(s)","band/orchestra/accompaniment","conductor/performer refinement","interpreted, remixed, modified by", _
		  "composer","lyricist/text writer","language(s)","content type","album/movie/show title","track number/position in set", _
		  "part of set","international standard recording code","date","year","time","recording dates","recording time","original release year", _
		  "original release time","beats per minute","media type","file type","copyright message","publisher","encoded by", _
		  "software/hardware + settings for encoding","length (ms)","size (bytes)","playlist delay","initial key","original album/movie/show title", _
		  "original filename","original artist(s)/performer(s)","original lyricist(s)/text writer(s)","file owner/licensee","internet radio station name", _
		  "internet radio station owner","set subtitle","mood","produced notice","encoding time","release time","tagging time","album sort order", _
		  "performer sort order","title sort order","user defined text information frame","official audio file webpage","official artist/performer webpage", _
		  "official audion source webpage","commercial information","copyright/legal information","publishers official webpage", _
		  "official internet radio station homepage","payment","user defined URL link frame","involved people list","musician credits list", _
		  "involved people list","unsynchronised lyrics/text transcription","comments","terms of use","unique file identifier","music CD identifier", _
		  "event timing codes","MPEG location lookup table","synchronised tempo codes","synchronised lyrics/text","relative volume adjustment", _
		  "relative volume adjustment (2)","equalization","equalization (2)","reverb","attached picture","general encapsulated object","play counter", _
		  "popularimeter","recommended buffer size","encrypted meta frame","audio encryption","linked information","position synchronisation frame", _
		  "commercial frame","encryption method registration","group indentification registration","private frame","ownership frame","signature frame", _
		  "seek frame","audio seek point index")
		  
		  
		  FileItem = fi
		  if FileItem<>nil then
		    ID3Tags = New Dictionary
		    GetID3Tags
		    // GetFolderImages
		  end if
		  Exception
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCleanUTFText(thisString As String) As String
		  Var tmpText As String = EncodeHex(thisString)
		  tmpText = tmpText.ReplaceAll("EFBFBD","") // EFBFBD is the UTF-8 representation of an unknown character
		  Do Until tmpText.Right(2)<>"00" // Strip NULL characters from end of UTF text
		    tmpText = tmpText.Left( tmpText.Length - 2 )
		  Loop
		  Return DecodeHex(tmpText)
		  Exception
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFolderImages()
		  // Let's see if any album art files exist in the song's directory
		  
		  Var picMb As MemoryBlock
		  Var filesAdded() As String
		  
		  Var embeddedImageFound As Boolean = If(ID3Images.Count>0,True,False)
		  
		  
		  For Each artFi As FolderItem In FileItem.Parent.Children
		    If artFi.IsFolder Then Continue
		    If artFi.Name.Right(4)<>".jpg" And artFi.Name.Right(5)<>".jpeg" And artFi.Name.Right(4)<>".png" Then Continue
		    Var mFile As BinaryStream = BinaryStream.Open(artFi,False)
		    picMb = New MemoryBlock( mFile.Length )
		    If Not embeddedImageFound  And artFi.Name.Lowercase.Left(6) = "folder" Then // Don't include folder.jpg/png if we already have an embedded pic (since it is almost always a duplicate)
		      picMb = mFile.Read(mFile.Length)
		      ID3Images.Add( picMb )
		      filesAdded.Add(artFi.NativePath)
		    ElseIf artFi.Name.Lowercase.Left(9) = "fanart.jp" Then
		      picMb = mFile.Read(mFile.Length)
		      ID3Images.Add( picMb )
		      filesAdded.Add(artFi.NativePath)
		    ElseIf artFi.Name.Lowercase.Left(10) = "fanart2.jp" Then
		      picMb = mFile.Read(mFile.Length)
		      ID3Images.Add( picMb )
		      filesAdded.Add(artFi.NativePath)
		    ElseIf Not embeddedImageFound And artFi.Name.Lowercase.Left(9) = "albumart_" And ( Not artFi.Name.Lowercase.Contains("small") ) Then
		      picMb = mFile.Read(mFile.Length)
		      ID3Images.Add( picMb )
		      filesAdded.Add(artFi.NativePath)
		      // ElseIf artFi.Name.Lowercase.Left(13) = "albumartsmall" Then
		      // picMb = mFile.Read(mFile.Length)
		      // ID3Images.Add( picMb )
		      // filesAdded.Add(artFi.NativePath)
		    End If
		  Next artFi
		  
		  For Each artFi As FolderItem In FileItem.Parent.Children
		    If artFi.IsFolder Then Continue
		    If artFi.Name.Right(4)<>".jpg" And artFi.Name.Right(5)<>".jpeg" And artFi.Name.Right(4)<>".png" And artFi.Name.Right(4)<>".gif" Then Continue
		    If filesAdded.IndexOf(artFi.NativePath) >= 0 Then Continue // Skip any files we already have
		    If embeddedImageFound And artFi.Name.Lowercase.Left(6) = "folder" Then Continue // Do not add folder.jpg/png if we already had an embedded pic
		    If artFi.Name.Lowercase.Contains("small.") Then Continue // Ignore any image with "small." in the filename
		    Var mFile As BinaryStream = BinaryStream.Open(artFi,False)
		    
		    picMb = New MemoryBlock( mFile.Length )
		    // Take EVERY OTHER JPG/PNG image we find in the same directory as the MP3 and display it (but only AFTER the above)
		    picMb = mFile.Read(mFile.Length)
		    ID3Images.Add( picMb )
		    filesAdded.Add(artFi.NativePath)
		  Next artFi
		  
		  // Let's try one last-ditch effort to find related artwork in the parent folder
		  If FileItem.Parent.Parent <> Nil And FileItem.Parent.Parent.IsFolder Then
		    For Each artFi As FolderItem In FileItem.Parent.Parent.Children
		      If artFi.IsFolder Then Continue
		      If artFi.Name.Right(4)<>".jpg" And artFi.Name.Right(5)<>".jpeg" And artFi.Name.Right(4)<>".png" And artFi.Name.Right(4)<>".gif" Then Continue
		      Var mFile As BinaryStream = BinaryStream.Open(artFi,False)
		      picMb = New MemoryBlock( mFile.Length )
		      If artFi.Name.Lowercase.Left(7) = "folder." Then // jpg or png
		        picMb = mFile.Read(mFile.Length)
		        ID3Images.Add( picMb )
		      ElseIf artFi.Name.Lowercase.Left(6) = "fanart" Then
		        picMb = mFile.Read(mFile.Length)
		        ID3Images.Add( picMb )
		      ElseIf artFi.Name.Lowercase.Left(9) = "albumart_" And ( Not artFi.Name.Lowercase.Contains("small") ) Then
		        picMb = mFile.Read(mFile.Length)
		        ID3Images.Add( picMb )
		        // ElseIf artFi.Name.Lowercase.Left(13) = "albumartsmall" Then
		        // picMb = mFile.Read(mFile.Length)
		        // ID3Images.Add( picMb )
		      ElseIf artFi.Name.Contains("logo") And ( artFi.Name.Contains(".png") Or artFi.Name.Contains(".jp") ) Then
		        picMb = mFile.Read(mFile.Length)
		        ID3Images.Add( picMb )
		      End If
		    Next artFi
		  End If
		  Exception
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetID3Tags()
		  LastError = ""
		  Try
		    Var mFile As BinaryStream = BinaryStream.Open(FileItem,False)
		    Var tagText As String
		    Var headerText As String = mFile.Read(10)
		    Var id3v1Exists As Boolean = False
		    Var id3v2Exists As Boolean = False
		    If headerText.Left(3) = "ID3" Then id3v2Exists = True
		    
		    Var curLoop As Integer = 0
		    Var maxTags As Integer = 100 // Failsafe to prevent hanging
		    If id3v2Exists Then
		      Var continueLooping As Boolean = True
		      mFile.BytePosition = 10 // Need to update this later if we implement the ID3V2 extended header. -ELK 20230803
		      Var readBytes As Integer = 10
		      While continueLooping
		        curLoop = curLoop + 1
		        If curLoop > maxTags Then continueLooping = False // Safety net for the unexpected
		        readBytes = 10 // Frame header is 10 bytes
		        tagText = mFile.Read(readBytes)
		        Var id3v230Idx As Integer = KnownId3Tags.IndexOf( tagText.Left(4) )
		        Var id3v220Idx As Integer = KnownId3v220Tags.IndexOf( tagText.Left(3) )
		        // ******************************************************************************************************
		        // THE FOLLOWING IS A RISKY LINE! It says, "ASSUME any v220 tag we find can be processed as if it were a v230 tag." 
		        // This was implemented to handle a v220 "TCM" tag ("TCMP") that appeared in the middle of other v230 tags.
		        // I assume it was tagged by an old program in the v220-v230 migration era.
		        // This line caused the file to be readable. -ELK 20230827
		        // ******************************************************************************************************
		        // If id3v230Idx < 0 And id3v220Idx >= 0 Then id3v230Idx = id3v220Idx
		        // ******************************************************************************************************
		        // This section must Binary.Read() all of the ID3 frame bytes thus advancing the BytePosition to the beginning of the next frame
		        // ******************************************************************************************************
		        If id3v230Idx >= 0 Then // We have an ID3 v2.20 4-character tag
		          Var knownTag As String = KnownId3Tags(id3v230Idx) // Convenience
		          Var mb As New MemoryBlock(4)
		          mb = tagText.MiddleBytes(4,4)
		          Try
		            readBytes = Integer.FromHex(EncodeHex(mb))
		          Catch ex As RuntimeException
		            // System.DebugLog("ERROR CONVERTING BINARY TO INT")
		            readBytes = 0
		          End Try
		          // System.DebugLog("ID3V230 Tag (" + FileItem.Name + "):" + KnownId3Tags(id3v230Idx) + "= " + KnownId3TagsComments(id3v230Idx) + "  TagText:'" + tagText + "' - ReadBytes:" + readBytes.ToString)
		          
		          // ******************************************************************************************************
		          // Some ID3 tagging programs suck, and create incorrect byte counts.
		          // This routine reads the bytes indicated, but searches the data for any other known tags before proceeeding.
		          // If known tags are found, the byte count is auto-corrected.
		          // This routine comes at a significant performance hit, but might be useful in extracting tags from
		          // poorly tagged files that are otherwise unreadable. -ELK 20231110
		          // ******************************************************************************************************
		          If enableAutoCorrectBadByteCounts And ( id3v230Idx > 0 Or id3v220Idx > 0 ) Then
		            Var tmpSearchArray() As String
		            If id3v230Idx > 0 Then
		              tmpSearchArray = KnownId3Tags
		            ElseIf id3v220Idx > 0 Then
		              tmpSearchArray = KnownId3v220Tags
		            End If
		            If tmpSearchArray.Count > 0 Then
		              Var tmpReadAhead As String = mFile.Read(readBytes)
		              mFile.BytePosition = mFile.BytePosition - readBytes // REWIND byte pointer since we're just doing a look-ahead
		              For sch As Integer = 0 To tmpSearchArray.LastIndex
		                Var tagPos As Integer = tmpReadAhead.IndexOfBytes( tmpSearchArray(sch) )
		                If tagPos >= 0 Then // If we FOUND a known tag, then we need to correct the byte counter and position
		                  readBytes = tagPos // Since tagPos is a zero-based index, the position matches the actual byte count
		                  Exit For sch
		                End If
		              Next sch
		            End If
		          End If
		          
		          
		          If readBytes < 16000000 Then // Ignore frames greater than 16Mb bytes (e.g. album art) which consume memory and bog down processing
		            // tagText = mFile.Read(readBytes)
		            // System.DebugLog("ID3V230 REMAINING FRAME TagText:'" + tagText + "' - ReadBytes:" + readBytes.ToString)
		            Var dataStartBytesPosition As Integer = mFile.BytePosition
		            Var tmpText As String
		            // // ******************************************************************
		            // // Exclude tags that don't use the "formatting/encoding" byte.
		            // // There may be other tags that need to be added here!
		            // // ******************************************************************
		            // If knownTag<>"PRIV" Then
		            // tmpText = mFile.Read(1) // Misc formating/encoding byte/flags ... this line simply moves the mFile.BytePosition pointer
		            // dataStartBytesPosition = dataStartBytesPosition + 1
		            // readBytes = readBytes - 1
		            // End If
		            // // ******************************************************************
		            // Var textStartPos As Integer = 0
		            // If ( EncodeHex(tagText) = "00" ) Or ( EncodeHex(tagText) = "01" ) Then // Misc Formatting/Encoding Byte ... currently ignored
		            // textStartPos = textStartPos + 1
		            // End If
		            
		            tmpText = mFile.Read(3) // Misc formating/encoding byte/flags, plus 2-byte look-ahead to check for UTF BOM
		            // dataStartBytesPosition = dataStartBytesPosition + 1
		            // readBytes = readBytes - 3
		            
		            // Examine the last two bytes of the three bytes read above to see if this tag contains a UTF BOM, and REWIND the byte counter if NOT
		            Var textEnc As TextEncoding = Nil // Encodings.ASCII
		            If ( EncodeHex(tmpText.Middle(1,2)) = "FFFE" ) Then // UTF-16LE (Little Endian)
		              textEnc = Encodings.UTF16LE
		              readBytes = readBytes - 3 // The actual text data is 2-bytes shorter (since UTF-BOM is not a part of it)
		            ElseIf ( EncodeHex(tmpText.Middle(1,2)) = "FEFF" ) Then // UTF-16BE (Big Endian)
		              textEnc = Encodings.UTF16BE
		              readBytes = readBytes - 3 // The actual text data is 2-bytes shorter (since UTF-BOM is not a part of it)
		            Else
		              mFile.BytePosition = mFile.BytePosition - 3 // Rewind the byte pointer so that we don't lose those three bytes we just checked for UTF BOM
		            End If
		            dataStartBytesPosition = mFile.BytePosition
		            
		            Try
		              If knownTag = "APIC" Then // If this is an album image, there is a separate header to parse ...
		                // APIC header and subheader is as follows:
		                // 10-byte header (as per usual) = "APIC" + size, etc.
		                // 1-byte = "Text encoding" (typically a 00, sometimes a 01 ... I ignore this byte ABOVE)
		                // Variable-bytes = MIME Type as null-terminated string
		                // 1-byte = Picture Type (00=Other, 01=32x32 pixel icon (PNG), 02=Other icon, 03=Cover (front), 04=Cover (back), 05=Leaflet, 06=Media, 07=Lead artist ... etc
		                // Variable-bytes = Description as null-terminated string
		                // At this BytePosition = BEGINS THE ACTUAL PICTURE DATA
		                // textStartPos = textStartPos + strMimeType.Length + 1 // Extra 1 for null-terminator
		                // tagText = tagText.Middle(textStartPos)
		                
		                tmpText = mFile.Read(1) // Misc formating/encoding byte/flags ... this line simply moves the mFile.BytePosition pointer 1 byte
		                dataStartBytesPosition = dataStartBytesPosition + 1
		                readBytes = readBytes - 1
		                
		                // Read variable null-terminated string
		                Var strMimeType As String
		                Var nullChar As Boolean = False
		                Do
		                  Var tmpChar As String = mFile.Read(1)
		                  If ( EncodeHex(tmpChar)="00" ) Then nullChar = True
		                  If Not nullChar Then strMimeType = strMimeType + tmpChar
		                Loop Until ( mFile.EndOfFile Or nullChar )
		                
		                // Read single byte picture type
		                Var strPictureType As String = mFile.Read(1)
		                
		                // Read variable null-terminated string
		                Var strDescription As String
		                Var strDescEncoding As String
		                nullChar = False
		                Do
		                  Var tmpChar As String
		                  If strDescEncoding = "FFFE" Then
		                    tmpChar = mFile.Read(1).DefineEncoding(Encodings.UTF16LE)
		                  ElseIf strDescEncoding = "FFFE" Then
		                    tmpChar = mFile.Read(1).DefineEncoding(Encodings.UTF16BE)
		                  Else
		                    tmpChar = mFile.Read(1)
		                  End If
		                  If ( EncodeHex(tmpChar)="00" ) Then nullChar = True
		                  If Not nullChar Then
		                    If strDescEncoding.Length < 4 Then strDescEncoding = strDescEncoding + EncodeHex(tmpChar) // Get first two bytes in hex (length=4)
		                    If strDescEncoding<>"FF" And strDescEncoding<>"FE" Then
		                      strDescription = strDescription + tmpChar
		                    End If
		                  End If
		                Loop Until ( mFile.EndOfFile Or nullChar )
		                If strDescEncoding = "FFFE" Or strDescEncoding = "FEFF" Then // The null terminator will actually be TWO bytes, so we need to read ONE MORE
		                  Var tmpChar As String = mFile.Read(1)
		                  If ( EncodeHex(tmpChar)<>"00" ) Then // This should be a "throw-away null". If not, then rewind the byte counter
		                    mFile.BytePosition = mFile.BytePosition - 1 // Rewind the byte pointer so that we don't lose that one byte we just read.
		                  End If
		                End If
		                Var picDataBytesStart As Integer = mFile.BytePosition
		                readBytes = readBytes - ( picDataBytesStart - dataStartBytesPosition )
		                Var picMb As New MemoryBlock( readBytes )
		                picMb = mFile.Read( readBytes )
		                ID3Images.Add( picMb ) // Picture.FromData(picMb)
		                
		              ElseIf knownTag = "TXXX" Then // If this is a user text tag, there is a separate description to parse ...
		                // TXXX header and subheader is as follows:
		                // 10-byte header (as per usual) = "TXXX" + size, etc.
		                // 1-byte = "Text encoding" (typically a 00, sometimes a 01 for UTF ... I ignore this byte ABOVE, and rely on the UTF BOM to detect UTF text)
		                // Variable-bytes = User Text DESCRIPTION as null-terminated string
		                // At this BytePosition = BEGINS THE ACTUAL TEXT DATA
		                // textStartPos = textStartPos + strMimeType.Length + 1 // Extra 1 for null-terminator
		                // tagText = tagText.Middle(textStartPos)
		                
		                // If there is no UTF BOM, then we still need to skip the "00"/"01" encoding byte
		                If textEnc = Nil Then
		                  tmpText = mFile.Read(1) // Misc formating/encoding byte/flags ... this line simply moves the mFile.BytePosition pointer 1 byte
		                  dataStartBytesPosition = dataStartBytesPosition + 1
		                  readBytes = readBytes - 1
		                End If
		                
		                // Read variable null-terminated string
		                Var strDescription As String
		                Var nullChar As Boolean = False
		                Do
		                  Var tmpChar As String
		                  If  textEnc <> Nil Then
		                    tmpChar = mFile.Read(2).DefineEncoding(textEnc)
		                  Else
		                    tmpChar = mFile.Read(1)
		                  End If
		                  If ( EncodeHex(tmpChar)="00" ) Or ( EncodeHex(tmpChar)="0000" ) Then nullChar = True
		                  If Not nullChar Then
		                    strDescription = strDescription + tmpChar
		                  End If
		                Loop Until ( mFile.EndOfFile Or nullChar )
		                
		                Var textDataBytesStart As Integer = mFile.BytePosition
		                
		                // If we have a UTF BOM, then we need to skip those 2 bytes
		                If ( textEnc<>Nil ) Then
		                  textDataBytesStart = textDataBytesStart + 2
		                  mFile.BytePosition = textDataBytesStart
		                End If
		                
		                readBytes = readBytes - ( textDataBytesStart - dataStartBytesPosition )
		                Var textMb As New MemoryBlock( readBytes )
		                textMb = mFile.Read( readBytes ).DefineEncoding(textEnc)
		                
		                Id3UserText.Value(strDescription) = textMb
		                
		              ElseIf knownTag = "COMM" Then // File can have MULTIPLE comments tags, so we need to add these to a string array
		                
		                If textEnc<>Nil Then
		                  tmpText = mFile.Read(readBytes).DefineEncoding(textEnc)
		                Else
		                  tmpText = mFile.Read(1) // Read the text format byte (which we ignore)
		                  readBytes = readBytes - 1
		                  tmpText = mFile.Read(readBytes)
		                End If
		                // tmpText = tmpText.DefineEncoding(textEnc)
		                tagText = tmpText.ConvertEncoding(Encodings.UTF8)
		                // tmpText = mFile.Read(1) // Get that last null-terminator byte and ignore it.
		                
		                Try
		                  ID3Comments.Add( GetCleanUTFText(tagText) )
		                Catch ex As RuntimeException
		                  System.DebugLog( ex.Message )
		                End Try
		                
		              ElseIf knownTag.Left(1) = "T" Or textEnc<>Nil Then // If this is a Text Information tag ...
		                
		                If textEnc<>Nil Then
		                  tmpText = mFile.Read(readBytes).DefineEncoding(textEnc)
		                  tagText = tmpText.ConvertEncoding(Encodings.UTF8)
		                Else
		                  tmpText = mFile.Read(1) // Read the text format byte (which we ignore)
		                  readBytes = readBytes - 1
		                  tagText = mFile.Read(readBytes) // Do NOT include the null terminator byte
		                  // tmpText = mFile.Read(1) // Null-terminator throw-away
		                  tagText = tagText.ConvertEncoding(Encodings.UTF8)
		                End If
		                // tmpText = tmpText.DefineEncoding(textEnc)
		                // tmpText = mFile.Read(1) // Get that last null-terminator byte and ignore it.
		                
		                Try
		                  ID3Tags.Value( KnownId3TagsDesc(id3v230Idx).Lowercase ) = GetCleanUTFText(tagText)
		                Catch ex As RuntimeException
		                  System.DebugLog( ex.Message )
		                End Try
		                
		              Else
		                tagText = mFile.Read(readBytes)
		                Try
		                  // Special handling for certain tags
		                  If knownTag = "PRIV" Then 
		                    // IGNORE
		                  ElseIf knownTag = "MCDI" Then
		                    // IGNORE
		                  Else
		                    ID3Tags.Value( KnownId3TagsDesc(id3v230Idx).Lowercase ) = GetCleanUTFText(tagText)
		                  End If
		                Catch ex As RuntimeException
		                  System.DebugLog( ex.Message )
		                End Try
		              End If
		            Catch textExc As RuntimeException
		              // System.DebugLog("ERROR setting or converting tagText: " + tagText) // Usually caused by crap data in a tag ... just ignore it
		              Continue
		            End Try
		          Else
		            mFile.BytePosition = mFile.BytePosition + readBytes // Skip whatever large data (e.g. album images) may exist
		          End If
		          // ******************************************************************************************************
		        ElseIf id3v220Idx >= 0 Then // We have an ID3 v2.20 3-character tag
		          
		          // THIS SECTION HAS *NOT* BEEN IMPLEMENTED YET (since ID3v220 was not widely accepted, I don't want to take the time at this point)
		          // We will attempt to continue looping, although since the byte position is likely to be wrong, this probably won't work. -ELK 20230803
		          // continueLooping = False
		          
		          Var knownTag As String = KnownId3v220Tags(id3v220Idx) // Convenience
		          Var mb As New MemoryBlock(3)
		          mb = tagText.MiddleBytes(3,3)
		          Try
		            readBytes = Integer.FromHex(EncodeHex(mb))
		          Catch ex As RuntimeException
		            // System.DebugLog("ERROR CONVERTING BINARY TO INT")
		            readBytes = 0
		          End Try
		          // System.DebugLog("ID3V220 Tag (" + FileItem.Name + "):" + KnownId3v220Tags(id3v220Idx) + "= " + KnownId3TagsComments(id3v220Idx) + "  TagText:'" + tagText + "' - ReadBytes:" + readBytes.ToString)
		          
		          // Since ID3v2.2 uses a 6-byte header, and we've already read 10-bytes, we need to rewind 4 bytes
		          mFile.BytePosition = mFile.BytePosition - 4
		          
		          // Read one byte encoding code
		          tagText = mFile.Read(1)
		          readBytes = readBytes - 1
		          
		          If ( knownTag = "TXX" ) Then
		            
		            // Read variable null-terminated string
		            Var strDescription As String
		            Var nullChar As Boolean = False
		            Do
		              Var tmpChar As String
		              tmpChar = mFile.Read(1)
		              If ( EncodeHex(tmpChar)="00" ) Then nullChar = True
		              If Not nullChar Then
		                strDescription = strDescription + tmpChar
		              End If
		            Loop Until ( mFile.EndOfFile Or nullChar Or strDescription.Length >= readBytes )
		            
		            readBytes = readBytes - strDescription.Bytes - 1 // Subtract an extra ONE for the null character
		            Var strText As String = mFile.Read(readBytes)
		            
		            Id3UserText.Value(strDescription) = strText
		            
		          ElseIf ( knownTag = "COM" ) Then
		            
		            // Read variable null-terminated string
		            Var strLang As String
		            Var nullChar As Boolean = False
		            Do
		              Var tmpChar As String
		              tmpChar = mFile.Read(1)
		              If ( EncodeHex(tmpChar)="00" ) Then nullChar = True
		              If Not nullChar Then
		                strLang = strLang + tmpChar
		              End If
		            Loop Until ( mFile.EndOfFile Or nullChar Or strLang.Length >= readBytes )
		            
		            readBytes = readBytes - strLang.Bytes - 1 // Subtract an extra ONE for the null character
		            Var strText As String = mFile.Read(readBytes)
		            ID3Comments.Add( strLang + ": " + strText )
		            
		          ElseIf ( knownTag = "PIC" ) Then
		            
		            Var tmpText As String = mFile.Read(3) // Image format
		            tmpText = mFile.Read(1) // Picture type
		            
		            // Read picture description null-terminated string
		            Var strDescription As String
		            Var nullChar As Boolean = False
		            Do
		              Var tmpChar As String
		              tmpChar = mFile.Read(1)
		              If ( EncodeHex(tmpChar)="00" ) Then nullChar = True
		              If Not nullChar Then
		                strDescription = strDescription + tmpChar
		              End If
		            Loop Until ( mFile.EndOfFile Or nullChar )
		            
		            Var textDataBytesStart As Integer = mFile.BytePosition
		            
		            readBytes = readBytes - strDescription.Bytes
		            
		            Var picMb As New MemoryBlock( readBytes )
		            picMb = mFile.Read( readBytes )
		            ID3Images.Add( picMb ) // Picture.FromData(picMb)
		            
		          Else
		            tagText = mFile.Read(readBytes)
		            ID3Tags.Value( KnownId3TagsDesc(id3v220Idx).Lowercase ) = GetCleanUTFText(tagText)
		            
		          End If
		          
		        Else
		          continueLooping = False
		        End If
		        If mFile.EndOfFile Then continueLooping = False
		      Wend
		    Else
		      // If ID3v2 tags do NOT exist, then check if ID3v1 tags exist
		      // ID3v1 are easy to extract ... they are simply tagged on as the last 128 bytes of the file, beginning with "TAG":
		      // - The first 3 characters are "TAG"
		      // - The rest of the tag characters are:
		      //     - 30-chars title, 30-chars artist, 30-chars album, 4-chars year, 30-chars comment
		      Var id3v1TagByteCount As Integer = 128
		      Var id3v1TagBegin As Int64 = FileItem.Length - id3v1TagByteCount
		      // System.DebugLog("Length:" + FileItem.Length.ToString + "  Tag begin byte:" + id3v1TagBegin.ToString)
		      mFile.BytePosition = id3v1TagBegin
		      tagText = mFile.Read(id3v1TagByteCount)
		      // System.DebugLog("TagText(" + tagText.Length.ToString + "):_BEG_'" + tagText + "'_END_   File:" + FileItem.Name)
		      If tagText.Left(3) = "TAG" Then id3v1Exists = True
		      If id3v1Exists Then 
		        
		        Try
		          ID3Tags.Value("title") = tagText.MiddleBytes(3,30).ToText.Trim
		        Exception
		          ID3Tags.Value("title") = ""
		        end try
		        
		        try
		          ID3Tags.Value("artist") = tagText.MiddleBytes(33,30).ToText.Trim
		        Exception
		          ID3Tags.Value("artist") = ""
		        end try
		        
		        try
		          ID3Tags.Value("album") = tagText.MiddleBytes(63,30).ToText.Trim
		        Exception
		          ID3Tags.Value("album") = ""
		        end try
		        
		        try
		          ID3Tags.Value("year") = tagText.MiddleBytes(93,4).ToText.Trim
		        Exception
		          ID3Tags.Value("year") = ""
		        end try
		        
		        'try
		        'ID3Tags.Value("comment") = tagText.MiddleBytes(97,30).ToText.Trim
		        'Exception
		        'ID3Tags.Value("title") = ""
		        'end try
		        
		        // ID3Tags.Value("GenreCode") = tagText.MiddleBytes(127,1).ToText // Ignore the genre code ... it's useless without implementing the actual text descriptions
		        // System.DebugLog("ID TAGS Dictionary:" + EKG.DebugDictionary(ID3Tags))
		        
		      End If
		    End If
		    
		    If mFile<>Nil Then mFile.Close
		    
		  Catch gex As RuntimeException
		    LastError = gex.Message
		  End Try
		  Exception
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		enableAutoCorrectBadByteCounts As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		FileItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ID3Comments() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ID3Images() As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		ID3Tags As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Id3UserText As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		KnownId3Tags() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		KnownId3TagsComments() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		KnownId3TagsDesc() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		KnownId3v220Tags() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastError As String
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastError"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="enableAutoCorrectBadByteCounts"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
