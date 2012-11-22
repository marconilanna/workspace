# Installation Instructions

Download the latest **Eclipse 3.8 Platform Runtime Binary** package from http://download.eclipse.org/eclipse/downloads/eclipse3x.html and extract it to your **Applications** folder.

Copy the `plugins.sh` script and edit it if necessary. Run `./plugins.sh help` for options or `./plugins.sh install` to download and install the following features:

* Java Development Tools
* JavaScript Development Tools
* Web Developer Tools
* Mylyn
* EGit
* Scala IDE (2.1 M2 for Scala 2.10.0-RC2)
* ScalaTest
* Scala Worksheet

*Optional:* Right-click **Eclipse.app** and select **Show Package Contents**. Navigate to **Contents**, **MacOS** and open the file **eclipse.ini**. Add the following after `-vmargs`:

```
-server
-Xms100m
-Xmx1500m
-XX:MaxPermSize=250m
-Dserver_port=1080
-Declipse.p2.unsignedPolicy=allow
```
