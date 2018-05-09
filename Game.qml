import QtQuick 2.0

Item {
    id: game
    property bool playersTurn: true
    property bool pieceMoving : false
    property string endText
    visible: true
    property int playersScore: 0
    property int opponentsScore: 0
    Text {
        text: parent.endText
        visible: true
        anchors.centerIn: parent
        font.pixelSize: 0 //
        color: "#0da000"
        z: 100
        id: infoWhoWon
        SequentialAnimation {
            id: showWhoWon
            ParallelAnimation {
                PropertyAnimation {
                    target: infoWhoWon
                    properties: "font.pixelSize"
                    from: 0
                    to: mainWindow.height/2
                    duration: 10000
                }
                PropertyAnimation {
                    target: infoWhoWon
                    properties: "opacity"
                    from: 0
                    to: 1.0
                    duration: 5000
                }
            }
            SequentialAnimation {
                PropertyAnimation {
                    target: infoWhoWon
                    to: "#7401ad"
                    properties: "color"
                    from: "#0da000"
                    duration: 2000
                }
                PropertyAnimation {
                    target: infoWhoWon
                    properties: "color"
                    to: "#0da000"
                    from: "#7401ad"
                    duration: 2000
                }
                loops: Animation.Infinite
            }
        }
    }
    function nextTurn()
    {
        if (playersTurn)
            playersTurn = false
        else
            playersTurn = true
    }
    onPlayersTurnChanged: {
        if (playersScore == 7)
        {
            endText = "You won!"
            state = "gameEnd"
            return;
        }
        if (opponentsScore == 7)
        {
            endText = "You lost!:("
            state = "gameEnd"
            return;
        }
        dice.state = "notRolled";
        if (!playersTurn)
            computerPlayer.move();
    }
    ComputerPlayer {
        id: computerPlayer
        computerPieces: board.computerPieces
    }
    Board {
        id: board
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: unit/2
    }
    Dice {
        id: dice
        anchors.left: board.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: board.unit
        width: 4*board.unit
        height: 2*board.unit
    }
    PlayersBoard {
        id: rectPlayers
    }
    OpponentsBoard {
    }
    states: State {
        name: "gameEnd"
        StateChangeScript {
            script: showWhoWon.start()
        }
    } 
    function tellWhatToDo()
    {
        rectPlayers.tellWhatToDo()
    }
}
