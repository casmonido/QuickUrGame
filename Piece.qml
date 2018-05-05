import QtQuick 2.0

Rectangle {
    function move() {
        state = "movingParent"
        crossedPathLength++
        mainWindow.playersTurn = false
    }
    property int crossedPathLength: 0
    radius: parent.height/2
    width:radius
    height: radius
    x: parent.width/4
    y: parent.height/4
    visible: true
    id: piece
    state: "parentChanged"
    states: [
        State {
            name: "movingParent"
            ParentChange {
                target: piece
                parent: piece.parent.parent.destinationSquare(piece.crossedPathLength, 1)
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
            when: !xyAnimation.running
            ParentChange {
                target: piece
                parent: piece.parent
            }
            PropertyChanges {
                target: clickable
                enabled: true
            }
        }
    ]
    transitions: Transition {
        from: "*"
        to: "movingParent"
        id: xyAnimation
        ParentAnimation {
            SmoothedAnimation {  properties: "x,y"; velocity: 200 }
        }
    }

    MouseArea {
        id: clickable
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton
        onClicked: {
            piece.move()
        }
    }
}
