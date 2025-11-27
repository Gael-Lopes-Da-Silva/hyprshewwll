import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.configs
import qs.components
import qs.services

ColumnLayout {
    required property var screen

    id: root

    Rectangle {
        radius: Config.sidebar.power.radius
        color: Appearance.sidebar.power.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: Config.sidebar.power.size
        Layout.preferredWidth: Config.sidebar.power.size

        Rectangle {
            color: "transparent"
            radius: Config.sidebar.power.radius

            anchors {
                fill: parent
                margins: Config.sidebar.power.button.margin
            }

            Icon {
                icon: GlobalIcons.power_fill
                color: Appearance.sidebar.power.button.color
                size: Config.sidebar.power.button.iconSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }

            MouseArea {
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                anchors {
                    fill: parent
                }

                onEntered: parent.color = Appearance.sidebar.power.button.hovered
                onExited: parent.color = "transparent"
            }
        }
    }
}
