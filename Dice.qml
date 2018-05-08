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
        if (rolledNum > 0)
            state = "rolled";
        else
            timer.start()
    }
    Timer {
        id:timer
        interval: 1000; repeat: false
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
        //anchors.verticalCenter: parent.verticalCenter
        font.pointSize : board.unit/4
        //bottomPadding: 3*board.unit/2
        text: "Roll"
    }
    states: [
        State {
            name: "notRolled"
            PropertyChanges { target: text; text: "Roll" }
            PropertyChanges { target: clickable; enabled:true; hoverEnabled : true }
        },
        State {
            name: "rolledZero"
            PropertyChanges { target: text; text: "Rolled number: 0" }
            PropertyChanges { target: clickable; enabled:false; hoverEnabled : false }
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
            if (dice.state != "rolled")
                dice.roll()
        }
        onEntered: {
            cursorShape = Qt.OpenHandCursor
        }
    }
}
