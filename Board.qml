import QtQuick 2.0

Grid {
    columns: 8
    rows: 8
    Repeater {
        model: 64
        Rectangle {
            color: "red"
            border.width: 1 // only for testing, must be 0
            width: 60 // FIXME there must be a way not to hardcode this
            height: 60 // FIXME there must be a way not to hardcode this
        }
    }
}
