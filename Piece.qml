import QtQuick 2.0


Rectangle {
    property int crossedPathLength: 0
    radius: parent.height/2
    width:radius
    height: radius
    anchors.centerIn: parent
    visible: true
    id: piece

    ParentAnimation {
        id: parentAnim
        target: piece
        newParent: parent.parent.destinationSquare(crossedPathLength, 1)
        NumberAnimation {
            target: piece
            properties: "opacity"
            from: 0.1
            to: 1.0
            easing.type: Easing.OutBack
            duration: 2000
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton|Qt.RightButton
        onPressed: {
            parentAnim.start()
            piece.crossedPathLength++
        }
    }
}
