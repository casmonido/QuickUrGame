import QtQuick 2.0

Piece {
    id: piece
    color: "white"
    property string typeName: "PlayersPiece"
    states: [
        State {
            name: "myTurn"
            when: (game.playersTurn && !xyAnimationP.running
                   && !wholePathCrossed && !resettingAnimation.running)
            ParentChange {
                target: piece
                parent: piece.parent
            }
            PropertyChanges {
                target: clickable
                enabled: true
                hoverEnabled: true
            }
        },
        State {
            name: "movingParent"
            ParentChange {
                target: piece
                parent: board.destinationSquare(piece)
                x: parent.getX(piece)
                y: parent.getY(piece)
            }
            PropertyChanges {
                target: clickable
                enabled: false
                hoverEnabled: false
            }
        },
        State {
            name: "resettingParent"
            extend: "movingParent"
        },
        State {
            name: "opponentsTurn"
            extend: "myTurn"
            when: (!xyAnimationP.running && !game.playersTurn
                   && !wholePathCrossed && !resettingAnimation.running)
            PropertyChanges {
                target: clickable
                enabled: false
            }
        },
        State {
            name: "wholePathCrossed"
            when: wholePathCrossed
            extend: "movingParent"
        }
    ]
    Connections {
        target: xyAnimationP
        onRunningChanged: {
            if(xyAnimationP.running)
                game.pieceMoving = true
            if(!xyAnimationP.running)
            {
                game.nextTurn()
                game.pieceMoving = false
            }
        }
    }
    transitions: [
        Transition {
            from: "*"
            to: "movingParent"
            id: xyAnimationP
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
    MouseArea {
        id: clickable
        anchors.fill: parent;
        hoverEnabled : true
        enabled: true
        acceptedButtons: Qt.LeftButton
        onReleased: {
            cursorShape = Qt.ArrowCursor
            if (!game.pieceMoving && piece.state != "opponentsTurn"
                    && dice.state == "rolled" && dice.rolledNum > 0)
            {
                //console.log("X "+piece.state)
                piece.move(dice.rolledNum)
            }
        }
        onPressed: {
            cursorShape = Qt.ClosedHandCursor
        }
        onEntered: {
            cursorShape = Qt.OpenHandCursor
        }
    }
}
