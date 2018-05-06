import QtQuick 2.0

Piece {
    id: playersPiece
    color: "white"
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
                parent: board.destinationSquare(playersPiece.crossedPathLength)
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
    transitions: Transition {
        from: "*"
        to: "movingParent"
        id: xyAnimationP
        ParentAnimation {
            SmoothedAnimation {  properties: "x,y"; velocity: 200 }
        }
    }
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
