import QtQuick 2.0

Rectangle {
    property int margin: parent.width/200
    property int unit: parent.width/15
    property int columns: 8
    property int rows: 3
    visible: true
    width: columns*unit+(columns+1)*margin
    height: (rows+2)*unit+(rows+1)*margin
    color: "#19468e"
    StartingSquare {
        id: b0 //black
        anchors.top: parent.top
    }
    StartingSquare {
        id: w0 //white
        anchors.bottom: parent.bottom
    }
    Square {//0
        id: b1
        image: "square4.png"
        bx: 0
        by: 0
    }
    Square {//1
        id: b2
        image: "square5.png"
        bx: 1
        by: 0
    }
    Square {//2
        image: "square1.png"
        bx: 2
        by: 0
    }
    Square {//3
        image: "square5.png"
        bx: 3
        by: 0
    }
    Square {//4
        image: "square4.png"
        bx: 6
        by: 0
    }
    Square {//5
        image: "square2.png"
        bx: 7
        by: 0
    }
    Square {//6
        image: "square3.png"
        bx: 0
        by: 1
    }
    Square {//7
        image: "square1.png"
        bx: 1
        by: 1
    }
    Square {//8
        image: "square6.png"
        bx: 2
        by: 1
    }
    Square {//9
        image: "square4.png"
        bx: 3
        by: 1
    }
    Square {//10
        image: "square1.png"
        bx: 4
        by: 1
    }
    Square {//11
        image: "square6.png"
        bx: 5
        by: 1
    }
    Square {//12
        image: "square5.png"
        bx: 6
        by: 1
    }
    Square {//13
        image: "square1.png"
        bx: 7
        by: 1
    }
    Square {//14
        image: "square4.png"
        bx: 0
        by: 2
    }
    Square {//15
        image: "square5.png"
        bx: 1
        by: 2
    }
    Square {//16
        image: "square1.png"
        bx: 2
        by: 2
    }
    Square {//17
        image: "square5.png"
        bx: 3
        by: 2
    }
    Square {//18
        image: "square4.png"
        bx: 6
        by: 2
    }
    Square {//19
        image: "square2.png"
        bx: 7
        by: 2
    }
}
