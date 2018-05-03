import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    id: mainWindow
    visible: true
    width: 1200
    height: 600
    title: qsTr("The royal game of Ur")

    Board {
        anchors.centerIn: parent
    }
}
