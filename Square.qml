import QtQuick 2.0

Rectangle {
    property string image
    width: height
    height: parent.height/10
    Image {
        source: parent.image
        anchors.fill: parent
        visible: true
    }
}
