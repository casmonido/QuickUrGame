import QtQuick 2.0

Rectangle {
    property var computerPieces: computerPiecesR
    function destinationSquare(p) {
        var i = 0
        for (i = 0; i<whiteRects.length; ++i)
        {
            whiteRects[i].z = 0;
            blackRects[i].z = 0;
        }
        if (p.crossedPathLength >= whiteRects.length)
        {
            endSquare.z = 10
            return endSquare;
        }
        if (p.typeName === "PlayersPiece")
        {
            whiteRects[p.crossedPathLength].z = 10
            return whiteRects[p.crossedPathLength];
        }
        blackRects[p.crossedPathLength].z = 10
        return blackRects[p.crossedPathLength];
    }
    property list<Rectangle> whiteRects
    property list<Rectangle> blackRects
    whiteRects: [sw, s3, s2, s1, s0, s6, s7, s8, s9, s10, s11, s12, s13, s5, s4]
    blackRects: [sb, s17, s16, s15, s14, s6, s7, s8, s9, s10, s11, s12, s13, s13, s19, s18]
    property int margin: parent.width/200
    property int unit: parent.width/15
    property int columns: 8
    property int rows: 3
    visible: true
    width: columns*unit+(columns+1)*margin
    height: (rows+2)*unit+(rows+1)*margin
    color: "#19468e"
    StartingSquare {
        id: sw
        anchors.top: parent.top
        Repeater {
            id: rep
            model: 7
            PlayersPiece {
            }
        }
    }
    StartingSquare {
        id: sb
        anchors.bottom: parent.bottom
        Repeater {
            id: computerPiecesR
            model: 7
            ComputersPiece {
            }
        }
        function getX(p) {
            for (var i = 0; i < computerPiecesR.count; ++i)
                if (computerPiecesR.itemAt(i) === p)
                return (i)*height + height/4
            return computerPiecesR.length*height + height/4
        }
    }
    Square {//0
        id: s0
        image: "square4.png"
        bx: 0
        by: 0
    }
    Square {//1
        id: s1
        image: "square5.png"
        bx: 1
        by: 0
    }
    Square {//2
        id: s2
        image: "square1.png"
        bx: 2
        by: 0
    }
    Square {//3
        id: s3
        image: "square5.png"
        bx: 3
        by: 0
    }
    Square {//4
        id: s4
        image: "square4.png"
        bx: 6
        by: 0
    }
    Square {//5
        id: s5
        image: "square2.png"
        bx: 7
        by: 0
    }
    Square {//6
        id: s6
        image: "square3.png"
        bx: 0
        by: 1
    }
    Square {//7
        id: s7
        image: "square1.png"
        bx: 1
        by: 1
    }
    Square {//8
        id: s8
        image: "square6.png"
        bx: 2
        by: 1
    }
    Square {//9
        id: s9
        image: "square4.png"
        bx: 3
        by: 1
    }
    Square {//10
        id: s10
        image: "square1.png"
        bx: 4
        by: 1
    }
    Square {//11
        id: s11
        image: "square6.png"
        bx: 5
        by: 1
    }
    Square {//12
        id: s12
        image: "square5.png"
        bx: 6
        by: 1
    }
    Square {//13
        id: s13
        image: "square1.png"
        bx: 7
        by: 1
    }
    Square {//14
        id: s14
        image: "square4.png"
        bx: 0
        by: 2
    }
    Square {//15
        id: s15
        image: "square5.png"
        bx: 1
        by: 2
    }
    Square {//16
        id: s16
        image: "square1.png"
        bx: 2
        by: 2
    }
    Square {//17
        id: s17
        image: "square5.png"
        bx: 3
        by: 2
    }
    Square {//18
        id: s18
        image: "square4.png"
        bx: 6
        by: 2
    }
    Square {//19
        id: s19
        image: "square2.png"
        bx: 7
        by: 2
    }
    EndSquare {
        id: endSquare
    }
}
