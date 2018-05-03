import QtQuick 2.0

Rectangle {
    property string image
    property int bx
    property int by
    x: bx*parent.unit + (bx+1)*parent.margin
    y: by*parent.unit + (by+1)*parent.margin
    width: parent.unit
    height: width
    Image {
        source: parent.image
        anchors.fill: parent
        visible: true
    }
}
