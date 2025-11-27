import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import "../../configs"
import "../../components"
import "../../services"

Variants {
    model: Quickshell.screens

    Scope {
        id: root

        required property var modelData

        Loader {
            active: GlobalStates.showSidebar

            sourceComponent: PanelWindow {
                screen: root.modelData
                color: "transparent"
                implicitWidth: Config.sidebar.implicitSize

                WlrLayershell.namespace: GlobalDatas.appId + "_sidebar"
                WlrLayershell.exclusionMode: ExclusionMode.Ignore

                anchors {
                    top: true
                    left: true
                    bottom: true
                }

                ColumnLayout {
                    spacing: Config.sidebar.spacing

                    anchors {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: Config.sidebar.topMargin
                    }

                    Launcher {
                        screen: root.screen

                        Layout.alignment: Qt.AlignCenter
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

                    Power {
                        screen: root.screen

                        Layout.alignment: Qt.AlignCenter
                    }
                }
            }
        }
    }
}
