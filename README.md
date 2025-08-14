# ⛫ kastal
## A secure personal media server that streams music and movies to all types of devices over the web
### Main features:
-  Easily handles a media library consisting of tens of thousands of audio and video files, even on a Raspberry Pi
-  Reads valid ID3 Tags
-  Streams media files of any size, to any web browser
-  Multi threaded quick scanning of local music and movie folders
-  Simple and easy to use user interface on all devises, less is more
-  Secure multi user support with secure email verification password reset functionality
-  Quick search for Song title, album, band or Movie title
-  Create private and/or public playlists
-  Monitoring of active sessions
### Supported audio file formats
-  mp3, m4a, m4u, aac
### Supported video file formats
-  mp4, m4v, mov
### Server requironments:
-  Raspberry Pi (2 and above, altough Gigabit Ethernet is highly recommended)
-  Mac
-  Win
-  Linux
## Quick Start
1) Download the appropriate [precompiled binary](https://github.com/gorillapappa/kastal/tree/main/Compiled%20Apps/RaspberryPi) and unzip it on the local server.
2) Run the following command in terminal:  
path/to/kastal/kastal --Port=8888 --UrlLength=1024
3) Then visit http://YourServerIP:8888/ to log in.
4) The first user to log in will automatically be assigned an admin account.
5) Set up the paths to your music and movie library folder in the "Admin" area and click the "Scan Music/Movie Folder" button.
6) Enjoy!  
(For HTTPS check [here](https://documentation.xojo.com/topics/web/ssl_for_web_apps.html) or use a [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) like [nginx](https://nginx.org/) or similar.)
### Screenshots
<img src="https://github.com/gorillapappa/kastal/blob/main/screenshots/musiclibrary.jpg" width="300"/> 
