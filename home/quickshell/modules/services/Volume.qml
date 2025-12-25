pragma Singleton
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
  id:root
  readonly property PwNode sink: Pipewire.defaultAudioSink
  property real value: Math.round(sink.audio.volume * 100)


  PwObjectTracker {
    objects: [ sink ]      
  }
}
