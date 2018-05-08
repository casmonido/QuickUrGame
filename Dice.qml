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
        if (rolledNum <= 0)
        timer.start()
    }
    Timer {
        id:timer
        interval: 2000; repeat: false
        onTriggered: game.nextTurn()
    }
    Row {
        Repeater {
            id: dieRepeater
            model: 4
            Die {
            }
        }
    }
    Text {
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        y: 5*board.unit/4
        font.letterSpacing: board.unit/40
        font.pointSize: board.unit/4
        text: "Roll"
    }
    states: [
        State {
            name: "notRolled"
            PropertyChanges { target: text; text: "Roll" }
            PropertyChanges { target: clickable; enabled:true; hoverEnabled : true }
        },
        State {
            name: "rolled"
            PropertyChanges { target: text; text: "Rolled number: " + rolledNum }
            PropertyChanges { target: clickable; enabled:false; hoverEnabled : false }
        }
    ]
    MouseArea {
        id: clickable
        anchors.fill: parent;
        hoverEnabled : true
        enabled: true
        acceptedButtons: Qt.LeftButton
        onPressed: {
            cursorShape = Qt.ClosedHandCursor
        }
        onReleased: {
            cursorShape = Qt.ArrowCursor
            if (dice.state !== "rolled")
                dice.roll()
        }
        onEntered: {
            cursorShape = Qt.OpenHandCursor
        }
    }
}
