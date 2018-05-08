import QtQuick 2.0

Rectangle {
    id: rectPlayers
    anchors.left: board.right
    anchors.top: board.top
    anchors.leftMargin: board.unit
    width: 4*board.unit
    height: board.unit
    color: "blue"
    opacity: 1.0
    Text {
        text: "YOUR TURN"
        anchors.centerIn: parent
        color: "white"
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
}
