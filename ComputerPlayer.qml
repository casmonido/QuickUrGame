import QtQuick 2.0

QtObject {
    property var computerPieces
    function move()
    {
        dice.roll()
        computerPieces.itemAt(0).move()
    }
}
