import QtQuick 2.0

Rectangle {
    property int crossedPathLength: 0
    radius: parent.height/2
    width:radius
    id: piece
    height: radius
    x: parent.width/4
    y: parent.height/4
    visible: true
    state: "parentChanged"
    function move() {
        state = "movingParent"
        crossedPathLength++
    }
}
