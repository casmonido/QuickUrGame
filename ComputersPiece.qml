import QtQuick 2.0

Piece {
    color: "black"
    id: piece
    states: [
        State {
            name: "movingParent"
            ParentChange {
                target: piece
                parent: piece.parent.parent.destinationSquare(piece.crossedPathLength, 1)
                x: parent.width/4
                y: parent.height/4
            }
        },
        State {
            name: "parentChanged"
            when: !xyAnimationC.running
            ParentChange {
                target: piece
                parent: piece.parent
            }
        }
    ]
    Connections {
        target: xyAnimationC
        onRunningChanged: {
            if(!xyAnimationC.running)
                game.state = "playersTurn"
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
