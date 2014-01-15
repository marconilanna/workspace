Installation Instructions
=========================

Download the [Eclipse 3.8.2 Platform Runtime Binary](http://archive.eclipse.org/eclipse/downloads/drops/R-3.8.2-201301310800/#PlatformRuntime) package and extract it into the **Applications** folder.

Copy the `plugins.sh` script and edit it if necessary. Run `./plugins.sh help` for options or `./plugins.sh install` to download and install the following features:

* Java Development Tools
* JavaScript Development Tools
* Web Developer Tools
* Mylyn
* EGit
* Scala IDE
* Play 2 IDE
* ScalaTest
* Scala Worksheet
* InSynth

Download the **SQL Editor** plugin from http://blog.debertshaeuser.com/index.php?page=eclipse-sql-editor and save it into the **Eclipse/dropins** folder.

*Optional:* Right-click **Eclipse.app** and select **Show Package Contents**. Navigate to **Contents**, **MacOS** and open the file **eclipse.ini**. Add the following after `-vmargs`:

```
-server
-Xss8m
-Xms100m
-Xmx1500m
-XX:MaxPermSize=250m
-Dserver_port=1080
-Declipse.p2.unsignedPolicy=allow
```
