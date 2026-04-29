import QtQuick
import Quickshell
import "./bar/"

ShellRoot {
   id: root   

   Loader {
      active: true
      sourceComponent: Bar{}
   }
}
