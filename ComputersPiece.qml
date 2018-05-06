import QtQuick 2.0

Piece {
    color: "black"
    id: piece
    states: [
        State {
            name: "opponentsTurn"
            extend: "myTurn"
            when: (!xyAnimationC.running && game.playersTurn)
        },
        State {
            name: "myTurn"
            when: (!xyAnimationC.running && !game.playersTurn)
            ParentChange {
                target: piece
                parent: piece.parent
            }
        },
        State {
            name: "movingParent"
            ParentChange {
                target: piece
                parent: board.destinationSquare("computer", piece.crossedPathLength)
                x: parent.width/4
                y: parent.height/4
            }
        }
    ]
    Connections {
        target: xyAnimationC
        onRunningChanged: {
            if(!xyAnimationC.running)
            {
                game.playersTurn = true
            }
        }
    }
    transitions: Transition {
        from: "*"
        to: "movingParent"
        id: xyAnimationC
        ParentAnimation {
            SmoothedAnimation {  properties: "x,y"; velocity: 200 }
        }
    }
}
