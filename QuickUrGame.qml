import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    id: mainWindow
    visible: true
    width: 1200
    height: 600
    title: qsTr("The royal game of Ur")

    Square {
        image: "square1.png"
        anchors.centerIn: parent
    }

    Board {
        anchors.centerIn: parent
    }
}
