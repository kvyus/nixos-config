pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
  property string ssid: ""     
  Process {
    id: getSSID
    command: ["sh", "-c", "iwgetid -r"]
    stdout: StdioCollector {
      onStreamFinished: ssid = data + "" == "" ? "No connection " : data      
    }
    Component.onCompleted: running = true
  }
  Timer {
    interval: 4000 
    running: true
    repeat: true
    onTriggered: getSSID.running = true
  }

} 
