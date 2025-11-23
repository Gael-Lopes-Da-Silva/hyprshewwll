import QtQuick

import "../configs"

Text {
    property real size: 16
    required property string icon

    text: icon

    font {
        family: Config.fonts.bootstrapIcons.name
        pointSize: size
    }
}
