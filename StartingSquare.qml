import QtQuick 2.0

Square {
    visible: true
    color:"transparent"
    width: 7*parent.unit
    anchors.horizontalCenter: parent.horizontalCenter
    function getX(p) {
        for (var i = 0; i < children.length; ++i)
            if (children[i] === p)
            return (i-1)*height + height/4
        return height/4
    }
    function getY(p) {
        return height/4
    }
}
