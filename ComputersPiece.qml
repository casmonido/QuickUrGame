import QtQuick 2.0

Piece {
    color: "black"
    property string typeName: "ComputersPiece"
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
                parent: board.destinationSquare(piece)
                x: parent.width/4
                y: parent.height/4
            }
        },
        State {
            name: "wholePathCrossed"
            ParentChange {
                target: piece
                parent: piece.parent
            }
//            PropertyChanges {
//                target: piece
//                visible: false // potrzebuję animacji?
//            }
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
            to: "wholePathCrossed"
            ParallelAnimation {
                PropertyAnimation {
                    target: piece
                    properties: "radius"
                    to: 0
                    duration: 1000
                }
                PropertyAnimation {
                    target: piece
                    properties: "opacity"
                    to: 0
                    duration: 1000
                }
            }
        }
    ]
}
