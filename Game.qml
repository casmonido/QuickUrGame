import QtQuick 2.0

Item {
    id: game
    property bool playersTurn: true
    property bool pieceMoving : false
    property string endText
    visible: true
    property int playersScore: 0
    property int opponentsScore: 0
    onPlayersTurnChanged: {
        if (playersScore == 7)
        {
            endText = "You won!"
            state = "gameEnd"
            return;
        }
        if (opponentsScore == 7)
        {
            endText = "You lost!"
            state = "gameEnd"
            return;
        }
        dice.state = "notRolled";
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
        anchors.leftMargin: board.unit
        width: 4*board.unit
        height: 2*board.unit
    }
    states: State {
        name: "gameEnd"
    }
}
