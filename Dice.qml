import QtQuick 2.0

Rectangle {
    visible: true
    id: dice
    color: "pink"
    property int rolledNum: 0
    function roll() {
        rolledNum = Math.floor(Math.random() * 4);
        state = "rolled";
    }
    Text {
        id: text
        anchors.centerIn: parent
        text: "Roll"
    }
    states: [
        State {
            name: "notRolled"
            PropertyChanges { target: text; text: "Roll" }
            PropertyChanges { target: clickable; enabled:true }
        },
        State {
            name: "rolled"
            PropertyChanges { target: text; text: "Rolled number:" + rolledNum }
            PropertyChanges { target: clickable; enabled:false }
        }
    ]
    MouseArea {
        id: clickable
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton
        onClicked: {
            dice.roll()
        }
    }
}
