import QtQuick 2.0

Rectangle {
    property int crossedPathLength: 0
    property bool wholePathCrossed: false
    radius: board.unit/2
    width:radius
    height: radius
    z: 100
    border.color: "grey"
    border.width: 1
    visible: true
    x: parent.getX(piece)
    y: parent.getY(piece)
    function move(rolledNum) {
        parent.commandLeave.disconnect(goBackToBeginning)
        crossedPathLength += rolledNum
        if (crossedPathLength >= board.whiteRects.length)
        {
            wholePathCrossed = true
            if (typeName === "PlayersPiece")
                game.playersScore++
            else
                game.opponentsScore++
            return;
        }
        state = "movingParent"
    }
    function goBackToBeginning(type)
    {
        if (typeName !== type)
            return;
        crossedPathLength = 0;
        parent.commandLeave.disconnect(goBackToBeginning)
        state = "resettingParent"
    }
    Text {
        anchors.fill: parent
        text: parent.parent.getDebug(piece)
    }
}
