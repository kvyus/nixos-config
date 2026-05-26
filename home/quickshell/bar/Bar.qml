
import QtQuick
import Quickshell
import "./modules/"

PanelWindow {
   id: bar

   property string myfont: "JetBrainsMono Nerd Font"
   property string textcolor: "#f5f5f5"

   anchors {
      top: true
      left: true
      right: true
   }

   implicitHeight: 30

   color: "#111111"
   
   SystemClock {
      id: clock
      precision: SystemClock.Seconds
   }

   Row {
      id: leftpart
      anchors.left: parent.left   
      anchors.verticalCenter: parent.verticalCenter
      anchors.leftMargin: 0
      spacing: 15

      Loader {
	 active: true
	 sourceComponent: Workspaces{}
      } 

   }

   Row {
      id: middlepart
      anchors.centerIn: parent
      anchors.verticalCenter: parent.verticalCenter
      spacing: 15

      Loader {
	 active: false
	 sourceComponent: Player{}
      }
   }

   Row {  
      id: rightpart
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      anchors.rightMargin: 5.25
      spacing: 15

      Loader {
	 active: true
	 sourceComponent: Volume{}
      }

      Loader { 
	 active: true
	 sourceComponent: Time{}
      }

   }
}
