import QtQuick 2.0

Rectangle {
    property int crossedPathLength: 0
    property bool wholePathCrossed: false
    radius: board.unit/2
    width:radius
    height: radius
    border.color: "grey"
    border.width: 1
    visible: true
    x: parent.getX(piece)
    y: parent.getY(piece)
    function move(rolledNum) {
        parent.commandLeave.disconnect(goBackToBeginning)
        crossedPathLength += rolledNum
        state = "movingParent"
    }
    function goBackToBeginning(type)
    {
        //console.log(type + " " + typeName)
        if (typeName !== type)
            return;
        crossedPathLength = 0;
        parent.commandLeave.disconnect(goBackToBeginning)
        state = "movingParent" //osobny
    }
}
