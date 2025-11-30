import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

import "components"

Loader {
    required property var screen

    id: root
    active: GlobalStates.showSidebar
    visible: GlobalStates.showSidebar
    sourceComponent: Item {
        implicitWidth: Config.sidebar.implicitSize

        ColumnLayout {
            spacing: Config.sidebar.spacing

            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: Config.sidebar.topMargin
            }

            Workspaces {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }
        }

        ColumnLayout {
            spacing: Config.sidebar.spacing

            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: Config.sidebar.bottomMargin
            }

            SystemTray {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }

            Status {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }

            Clock {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }

            Power {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
