pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    property var options: QtObject {}

    property var fonts: QtObject {
        property var bootstrapIcons: FontLoader {
            source: "../assets/fonts/bootstrap-icons.woff2"
        }
    }

    property var icons: QtObject {
        property string wifi: "\uF61C"
        property string wifi_1: "\uF619"
        property string wifi_2: "\uF61A"
        property string wifi_off: "\uF61B"
    }
}
