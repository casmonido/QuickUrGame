import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    id: mainWindow
    visible: true
    width: 600
    height: 300
    title: qsTr("The royal game of Ur")
    Game {
        anchors.fill: parent
    }
}
