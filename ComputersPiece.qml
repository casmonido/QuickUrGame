import QtQuick 2.0

Piece {
    color: "black"
    property string typeName: "ComputersPiece"
    id: piece
    states: [
        State {
            name: "opponentsTurn"
            extend: "myTurn"
            when: (!xyAnimationC.running && game.playersTurn
                   && !wholePathCrossed && !resettingAnimation.running)
        },
        State {
            name: "myTurn"
            when: (!xyAnimationC.running && !game.playersTurn
                   && !wholePathCrossed && !resettingAnimation.running)
            ParentChange {
                target: piece
                parent: piece.parent
            }
        },
        State {
            name: "movingParent"
            ParentChange {
                target: piece
                parent: board.destinationSquare(piece)
                x: parent.width/4
                y: parent.height/4
            }
        },
        State {
            name: "resettingParent"
            extend: "movingParent"
        },
        State {
            when: wholePathCrossed
            name: "wholePathCrossed"
            extend: "movingParent"
        }
    ]
    Connections {
        target: xyAnimationC
        onRunningChanged: {
            if(!xyAnimationC.running)
                game.nextTurn()
        }
    }
    transitions: [
        Transition {
            from: "*"
            to: "movingParent"
            id: xyAnimationC
            SequentialAnimation {
                ParentAnimation {
                    SmoothedAnimation {  properties: "x,y"; velocity: 200 }
                }
                ScriptAction {
                    script: piece.parent.tryAndOccupy(piece)
                }
            }
        },
        Transition {
            from: "*"
            to: "resettingParent"
            id: resettingAnimation
            ParentAnimation {
                SmoothedAnimation {  properties: "x,y"; velocity: 200 }
            }
        },
        Transition {
            from: "*"
            to: "wholePathCrossed"
            SequentialAnimation {
                ParallelAnimation {
                    ParentAnimation {
                        SmoothedAnimation { target:piece;  properties: "x,y"; duration: 2000 }
                    }
                    PropertyAnimation {
                        target:piece
                        properties: "opacity"
                        from: 1.0
                        to: 0.0
                        duration: 2000
                    }
                }
                ScriptAction {
                    script: game.nextTurn()
                }
            }
        }
    ]
}
