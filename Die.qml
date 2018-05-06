import QtQuick 2.0

Item {
    property string imageUp: "diceup.gif"
    property string imageDown: "dicedown.gif"
    property int rolledNum: 0
    width: 3*board.unit/4
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
    Image {
        id: image
        anchors.fill: parent
        visible: true
    }
    state: "rolled0"
}

