import QtQuick 2.0


Rectangle {
    property int crossedPathLength: 0
    radius: parent.height/2
    width:radius
    height: radius
    //anchors.centerIn: parent
    x: parent.width/4
    y: parent.height/4
    visible: true
    id: piece



    states: State {
        name: "reparented"
        ParentChange {
            target: piece;
            parent: piece.parent.parent.destinationSquare(crossedPathLength, 1)
            x: piece.parent.width/4; //parent.getX()
            y: piece.parent.height/4;
        }
        PropertyChanges { target: piece } //piece.crossedPathLength++
    }
    transitions: Transition {
        ParentAnimation {
            NumberAnimation {
                properties: "x,y";
                duration: 1000
                easing.type: Easing.Linear
            }
        }
    }
    MouseArea {
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton
        onClicked: {
            piece.state = "reparented"
            piece.crossedPathLength++
            state = "disabled"
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
