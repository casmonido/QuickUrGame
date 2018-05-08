import QtQuick 2.0

Rectangle {
    anchors.left: board.right
    anchors.top: board.top
    anchors.leftMargin: board.unit
    width: 4*board.unit
    height: board.unit
    color: "#1a8c09"
    opacity: 1.0
    Text {
        id: text
        text: "YOUR TURN"
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: board.unit/3
        font.letterSpacing: board.unit/40
    }
    states: [
        State {
            name: "playersTurn"
            when: game.playersTurn
            PropertyChanges {
                target: rectPlayers
                opacity: 1.0
            }
        },
        State {
            name: "opponentsTurn"
            when: !game.playersTurn
            PropertyChanges {
                target: rectPlayers
                opacity: 0.2
            }
        }
    ]
    transitions: [
        Transition {
            from: "*"
            to: "*"
            PropertyAnimation {
                properties: "opacity"
                duration: 500
            }
        }
    ]
//    ParallelAnimation {
//        id: pickPiece
//        //PropertyAnimation
//    }
    function tellWhatToDo()
    {
        text.text = "PICK YOUR PIECE"
        //pickPiece.start()
    }
}
