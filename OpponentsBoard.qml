import QtQuick 2.0

Rectangle {
    id: rectPlayers
    anchors.left: board.right
    anchors.bottom: board.bottom
    anchors.leftMargin: board.unit
    width: 4*board.unit
    height: board.unit
    color: "red"
    opacity: 1.0
    Text {
        text: "OPPONENTS TURN"
        anchors.centerIn: parent
        color: "white"
    }
    states: [
        State {
            name: "playersTurn"
            when: !game.playersTurn
            PropertyChanges {
                target: rectPlayers
                opacity: 1.0
            }
        },
        State {
            name: "opponentsTurn"
            when: game.playersTurn
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
}
