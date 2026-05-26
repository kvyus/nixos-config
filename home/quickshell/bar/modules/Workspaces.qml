import Quickshell
import QtQuick.Layouts
import QtQuick
import Quickshell.Hyprland

Row {
   id: row
   anchors.verticalCenter: parent
   spacing: 5
   Repeater {
      model: Hyprland.workspaces.values
      Rectangle {
         height: 30
         width: 27
         radius: 0
         color: modelData.active ? "#b21109" : "transparent"
         Text {
            anchors.centerIn: parent
            text: modelData.id
            x: 5.25
            font.pixelSize: 15
            font.family: myfont
            color: textcolor
         }
      }
   }
}
