import QtQuick 2.0

Square {
    visible: true
    color:"transparent"
    width: 7*parent.unit
    anchors.horizontalCenter: parent.horizontalCenter
    function getX(p) {
        for (var i = 0; i < rep.count; ++i)
            if (rep.itemAt(i) === p)
                return (i)*height + height/4
        return rep.length*height + height/4
    }
    function getY(p) {
        return height/4
    }
}
