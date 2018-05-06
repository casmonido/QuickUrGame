import QtQuick 2.0

Rectangle {
    property int crossedPathLength: 0
    property bool wholePathCrossed: false;
    radius: parent.height/2
    width:radius
    height: radius
    x: parent.width/4
    y: parent.height/4
    visible: true
    function move(rolledNum) {
        crossedPathLength += rolledNum
        state = "movingParent"
    }
}
