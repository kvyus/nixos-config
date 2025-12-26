import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../services/"
import "./modules/"

PanelWindow {
    id:panel
    property string myfont: "GeistMono Nerd Font"
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
               height: 27
               width: 27
               radius: 100
               color: modelData.active ? "#666666" : "transparent"
               Text {
                 text: modelData.id
                 anchors.centerIn: parent
                 font.pixelSize: 15
                 font.family: myfont
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
             id: wi_fi
             text: Wifi.ssid
             color: "#ffffff"
             font.family: myfont
             font.pixelSize: 15
           }

           Text {
             id: volvalue
             text: "  " + Volume.value + "%"
             color: "#ffffff"
             font.family: myfont
             font.pixelSize: 15
           }
           
           Text {
             id: time
             text: Qt.formatDateTime(clock.date, "hh:mm:ss")
             color: "#ffffff"
             font.family: myfont
             font.pixelSize: 15
           }
         }
       }
   }  
}
 
