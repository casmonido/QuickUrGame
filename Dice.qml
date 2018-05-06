import QtQuick 2.0

Rectangle {
    visible: true
    id: dice
    color: "pink"
    property int rolledNum: 0
    function roll() {
        rolledNum = 0
        for (var i=0; i<4; ++i)
            rolledNum += dieRepeater.itemAt(i).roll()
        state = "rolled";
    }
    Row {
        spacing: board.unit/4
        Repeater {
            id: dieRepeater
            model: 4
            Die {
            }
        }
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
            if (dice.state != "rolled")
                dice.roll()
        }
    }
}
