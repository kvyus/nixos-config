import QtQuick
import Quickshell
import Quickshell.Hyprland


PanelWindow {
    id:panel
    anchors {
      top: true
      left: true
      right:true

    }
    implicitHeight:40
    margins {
      top: 0
      left: 0
      right: 0
    }
     Rectangle {
       id: mainbar
       anchors.fill: parent
       color: "#1d2021"
       Row {
         anchors.fill: parent
         Row {
           id: workspaces
           spacing: 5
           anchors.left: parent.left
           anchors.leftMargin: 10
           anchors.verticalCenter: parent.verticalCenter
           Repeater {
             id: rep
             model: Hyprland.workspaces.values
             Rectangle {
               height: 30
               width: 25
               radius: 6
               color: modelData.active ? "#cc241d" : "transparent"

               Text {
                 text: modelData.id
                 anchors.centerIn: parent
                 font.pixelSize: 15
                 font.family: "JetBrains Mono Nerd Font"
                 color: "#ffffff"
               }
             }
           }

         }

         SystemClock {
           id: clock
           precision: SystemClock.Seconds
         }
         Row{
           anchors.right: parent.right
           anchors.rightMargin: 10
           anchors.verticalCenter: parent.verticalCenter
           spacing:15

           Text {
             id: time
             text: Qt.formatDateTime(clock.date, "hh:mm:ss")
             color: "#ffffff"
             font.family: "JetBrains Mono Nerd Font"
             font.pixelSize: 15
           }
         }
       }
   }  
}
 
