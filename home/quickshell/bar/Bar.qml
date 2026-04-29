
import QtQuick
import Quickshell
import "./modules/"

PanelWindow {
   id: bar

   property string myfont: "JetBrainsMono Nerd Font"
   property string textcolor: "#fbf1c7"

   anchors {
      top: true
      left: true
      right: true
   }

   implicitHeight: 40

   color: "#282828"

   
   SystemClock {
      id: clock
      precision: SystemClock.Seconds
   }

   Row {
      id: leftpart
      anchors.left: parent.left   
      anchors.verticalCenter: parent.verticalCenter
      anchors.leftMargin: 7
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
      anchors.rightMargin: 7
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
