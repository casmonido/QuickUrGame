import QtQuick 2.0

Item {
    id: game
    property bool playersTurn: true
    property bool pieceMoving : false
    visible: true
    onPlayersTurnChanged: {
        if (!playersTurn)
            computerPlayer.move();
    }

    ComputerPlayer {
        id: computerPlayer
        computerPieces: board.computerPieces
    }
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
