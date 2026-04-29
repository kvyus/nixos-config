import Quickshell
import QtQuick.Layouts
import QtQuick
import Quickshell.Hyprland

Rectangle {
   id: workspacesrect
   implicitWidth: row.width + 10
   implicitHeight: 30
   radius: 7
   color: "#3c3836" 
   Row {
      id: row
      anchors.centerIn: parent
      spacing: 5
      Repeater {
	 model: Hyprland.workspaces.values
         Rectangle {
            height: 20
            width: 20
            radius: 7
            color: modelData.active ? "#fb4934" : "transparent"
            Text {
               text: modelData.id
               x: 5.25
               y: 0
               font.pixelSize: 15
               font.family: myfont
               color: modelData.active ? "#282828" : textcolor
            }
         }
      }
   }
}
