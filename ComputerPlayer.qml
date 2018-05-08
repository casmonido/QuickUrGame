import QtQuick 2.0

Item {
    property var computerPieces
    Timer {
        id:afterRollTimer
        interval: 1000; repeat: false
        onTriggered: computerPlayer.movePiece()
    }
    function move()
    {
        dice.roll()
        if (dice.rolledNum <= 0)
            return;
        afterRollTimer.start()
    }
    function movePiece() {
        var rand = 0;
        do {
            rand = Math.floor(Math.random() * 6);
        } while (computerPieces.itemAt(rand).wholePathCrossed);
        computerPieces.itemAt(rand).move(dice.rolledNum)
    }
}
