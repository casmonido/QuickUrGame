import QtQuick 2.0


Rectangle {
    function move() {
        state = "movingParent"
        crossedPathLength++
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
        },
        State {
            name: "parentChanged"
            when: !xyAnimation.running
            ParentChange {
                target: piece
                parent: piece.parent
                x: parent.width/4
                y: parent.height/4
            }
            PropertyChanges {
                target: piece
                color: "blue"
            }
        }
    ]
    transitions: Transition {
        from: "*"
        to: "movingParent"
        id: xyAnimation
        ParentAnimation {
            NumberAnimation {  properties: "x,y"; duration: 1000 }
        }
    }

    MouseArea {
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton
        onClicked: {
            piece.move()
            //state = "disabled"
        }

        states: [
            State {
                name: "enabled"
                PropertyChanges {target: parent; enabled:true}
            },
            State {
                name: "disabled"
                PropertyChanges {target: parent; enabled:false}
            }
        ]
    }
}
