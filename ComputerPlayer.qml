import QtQuick 2.0

QtObject {
    property var computerPieces
    function move()
    {
        dice.roll()
        if (dice.state !== "rolled")
            return
        var rand = 0;
        do {
            rand = Math.floor(Math.random() * 6);
        } while (computerPieces.itemAt(rand).wholePathCrossed);
        computerPieces.itemAt(rand).move(dice.rolledNum)
    }
}
