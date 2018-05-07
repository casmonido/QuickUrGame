import QtQuick 2.0

Rectangle {
    property string image
    property int bx
    property int by
    signal commandLeave(string type)
    function tryAndOccupy(p) {
        if (p.typeName === "PlayersPiece")
            commandLeave("ComputersPiece");
        else
            commandLeave("PlayersPiece");
        commandLeave.connect(p.goBackToBeginning)
    }
    function getX(p) {
        for (var i = 0; i < children.length; ++i)
            if (children[i] === p)
            return width/4 - i*unit/40
        return width/4 + unit/40
    }
    function getY(p) {
        for (var i = 0; i < children.length; ++i)
            if (children[i] === p)
                return height/4 - i*unit/40
        return height/4 + unit/40
    }
    x: bx*parent.unit + (bx+1)*parent.margin
    y: (by+1)*parent.unit + (by+1)*parent.margin
    width: parent.unit
    height: parent.unit
    Image {
        source: parent.image
        anchors.fill: parent
        visible: true
    }
}
