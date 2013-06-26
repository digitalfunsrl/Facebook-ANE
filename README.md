Facebook-ANE
============

Facebook Adobe Air Extension

This extension is meant to help programmers, using the Facebook native iOS/Android SDK on mobile applications, created using Adobe Air.
The result of this work is an ANE file, which will be included inside the application and will need this code to be used:

import com.digitalfun.pingback.PingBack;

var pb:PingBack = new PingBack();

Android Facebook SDK include step-by-step:
==========================================

First of all you need to know how to create an Air Native Extension(ANE) and for this purpose here's a very nice guide:
http://www.adobe.com/devnet/air/articles/building-ane-ios-android-pt1.html

And also how to include Facebook SDK in your project:
https://developers.facebook.com/docs/getting-started/facebook-sdk-for-android/3.0/

After you're done with the programming, you'll need to export your project as a JAR file. After this, you'll need the merge.bat tool included in this repository to make the com.facebook package be included in your com.example package.

The tool essentially runs two commands:

jar -xf facebooksdk.jar
jar -uf pingback.jar com

the first one gets the "com" directory out of the facebooksdk.jar, the second one includes it in the pingback.jar file.
