import QtQuick 2.0

Piece {
    id: piece
    color: "white"
    property string typeName: "PlayersPiece"
    states: [
        State {
            name: "myTurn"
            when: (game.playersTurn && !xyAnimationP.running && !wholePathCrossed)
            ParentChange {
                target: piece
                parent: piece.parent

            }
            PropertyChanges {
                target: clickable
                enabled: true
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
            }
        },
        State {
            name: "opponentsTurn"
            extend: "myTurn"
            when: (!xyAnimationP.running && !game.playersTurn && !wholePathCrossed)
            PropertyChanges {
                target: clickable
                enabled: false
            }
        },
        State {
            name: "wholePathCrossed"
            when: wholePathCrossed
            ParentChange {
                target: piece
                parent: piece.parent
            }
            PropertyChanges {
                target: clickable
                enabled: false
            }
        }
    ]
    Connections {
        target: xyAnimationP
        onRunningChanged: {
            if(xyAnimationP.running)
                game.pieceMoving = true
            if(!xyAnimationP.running)
            {
                game.playersTurn = false
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
            to: "wholePathCrossed"
            ParallelAnimation {
                PropertyAnimation {
                    properties: "radius"
                    from: board.unit/2
                    to: 0
                    duration: 2000
                }
                PropertyAnimation {
                    properties: "opacity"
                    from: 1.0
                    to: 0.0
                    duration: 2000
                }
            }
        }
    ]

    MouseArea {
        id: clickable
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton
        onClicked: {
            if (!game.pieceMoving && piece.state != "opponentsTurn"
                    && dice.state == "rolled")
            {
                //console.log("X "+piece.state)
                piece.move(dice.rolledNum)
            }
        }
    }

}
