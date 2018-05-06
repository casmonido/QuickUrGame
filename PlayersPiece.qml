import QtQuick 2.0

Piece {
    id: piece
    color: "white"
    states: [
        State {
            name: "movingParent"
            ParentChange {
                target: piece
                parent: board.destinationSquare(piece.crossedPathLength)
                x: parent.width/4
                y: parent.height/4
            }
            PropertyChanges {
                target: clickable
                enabled: false
            }
        },
        State {
            name: "parentChanged"
            when: !xyAnimationP.running
            ParentChange {
                target: piece
                parent: piece.parent
            }
            PropertyChanges {
                target: clickable //not really?
                enabled: true
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
            if (!game.pieceMoving)
                piece.move(dice.rolledNum)
        }
    }
}
