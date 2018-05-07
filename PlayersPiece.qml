import QtQuick 2.0

Piece {
    id: playersPiece
    color: "white"
    property string typeName: "PlayersPiece"
    states: [
        State {
            name: "myTurn"
            when: game.playersTurn && !xyAnimationP.running
            ParentChange {
                target: playersPiece
                parent: playersPiece.parent
            }
            PropertyChanges {
                target: clickable
                enabled: true
            }
        },
        State {
            name: "movingParent"
            ParentChange {
                target: playersPiece
                parent: board.destinationSquare(playersPiece)
                x: parent.width/4
                y: parent.height/4
            }
            PropertyChanges {
                target: clickable
                enabled: false
            }
        },
        State {
            name: "opponentsTurn"
            extend: "myTurn"
            when: !xyAnimationP.running && !game.playersTurn
            PropertyChanges {
                target: clickable
                enabled: false
            }
        },
        State {
            name: "wholePathCrossed"
            ParentChange {
                target: playersPiece
                parent: playersPiece.parent
            }
            PropertyChanges {
                target: clickable
                enabled: false
            }
//            PropertyChanges {
//                target: playersPiece
//                visible: false // potrzebuję animacji?
//            }
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
                    script: playersPiece.parent.tryAndOccupy(playersPiece)
                }
            }
        },
        Transition {
            from: "*"
            to: "wholePathCrossed"
            ParallelAnimation {
                PropertyAnimation {
                    properties: "radius"
                    to: 0
                    duration: 1000
                }
                PropertyAnimation {
                    properties: "opacity"
                    to: 0
                    duration: 1000
                }
            }
        }
    ]

    MouseArea {
        id: clickable
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton
        onClicked: {
            if (!game.pieceMoving && playersPiece.state != "opponentsTurn"
                    && dice.state == "rolled")
            {
                //console.log("X "+playersPiece.state)
                playersPiece.move(dice.rolledNum)
            }
        }
    }

}
