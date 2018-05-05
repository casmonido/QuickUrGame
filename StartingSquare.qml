import QtQuick 2.0

Square {
    visible: true
    color:"transparent"
    width: 7*parent.unit
    anchors.horizontalCenter: parent.horizontalCenter
    Repeater {
        model: 7
        Piece {
            color: "black"
        }
    }
}
