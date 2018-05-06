import QtQuick 2.0

Item {
    id: game
    property bool playersTurn: true
    visible: true
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
    states: [
        State {
            name: "playersTurn"
            PropertyChanges {
                target: game
                playersTurn: true
            }
            StateChangeScript {
                name: "firstScript"
                script: console.log("entering first state")
            }
        },
        State {
            name: "computersTurn"
            PropertyChanges {
                target: game
                playersTurn: false
            }
            StateChangeScript {
                name: "secondScript"
                script: computerPlayer.move()
            }
        }
    ]
}
