import QtQuick 2.0

Item {
    property string imageUp: "diceup.gif"
    property string imageDown: "dicedown.gif"
    property int rolledNum: 0
    property bool rolling: false
    width: board.unit
    height: 110*width/125
    function roll()
    {
        rolledNum = Math.floor(Math.random() * 2);
        return rolledNum;
    }
    states: [
        State {
            name: "rolled1"
            when: rolledNum==1
            PropertyChanges {
                target: image
                source: imageUp
            }
        },
        State {
            name: "rolled0"
            when: rolledNum==0
            PropertyChanges {
                target: image
                source: imageDown
            }
        }
    ]
    NumberAnimation on rotation {
        duration: (Math.random()*3000+1000)
        easing.type: Easing.Linear
        from: 0
        to: 360
        running: clickable.containsMouse && !clickable.pressed
        loops: Animation.Infinite
    }

    Image {
        width: 3*parent.width/4
        height: 3*parent.height/4
        id: image
        anchors.centerIn: parent
        visible: true
    }
    state: "rolled0"
}

