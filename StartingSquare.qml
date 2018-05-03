import QtQuick 2.0

Square {
    visible: true
    color:"transparent"
    width: 7*parent.unit
    anchors.horizontalCenter: parent.horizontalCenter
    Piece {
        color: "black"
    }
}
