import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    id: mainWindow
    property bool playersTurn: true

    visible: true
    width: 1200
    height: 600
    title: qsTr("The royal game of Ur")
    Board {
        id: board
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: unit/2
    }
    Dice {
        id: dice
        anchors.left: board.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: board.unit/2
        width: 5*board.unit
        height: 4*board.unit
    }
}
