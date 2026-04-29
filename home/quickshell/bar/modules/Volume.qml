import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Text {
   readonly property PwNode sink: Pipewire.defaultAudioSink
   PwObjectTracker {
      objects: [ sink ]      
   }

   text: Math.round(sink.audio.volume * 100) + "%"
   font.pixelSize: 15
   font.family: myfont
   color: textcolor
}
