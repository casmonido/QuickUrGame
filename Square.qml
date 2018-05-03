import QtQuick 2.0

Rectangle {
    property string image
    property int bx
    property int by
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
