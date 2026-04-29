import Quickshell
import QtQuick


Text {
   id: showtime
   text: Qt.formatDateTime(clock.date, "hh:mm")
   font.family: myfont
   color: textcolor
   font.pixelSize: 15
}

