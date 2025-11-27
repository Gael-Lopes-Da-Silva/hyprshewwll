import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

import "components"

Loader {
    id: root
    active: GlobalStates.showSidebar
    visible: GlobalStates.showSidebar
    sourceComponent: Variants {
        model: Quickshell.screens

        Scope {
            id: scope

            required property var modelData

            PanelWindow {
                screen: scope.modelData
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

                    Loader {
                        active: true
                        visible: true
                        sourceComponent: Workspaces {
                            screen: scope.screen
                        }

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

                    Loader {
                        active: true
                        visible: true
                        sourceComponent: SystemTray {
                            screen: scope.screen
                        }

                        Layout.alignment: Qt.AlignCenter
                    }

                    Loader {
                        active: true
                        visible: true
                        sourceComponent: Status {
                            screen: scope.screen
                        }

                        Layout.alignment: Qt.AlignCenter
                    }

                    Loader {
                        active: true
                        visible: true
                        sourceComponent: Clock {
                            screen: scope.screen
                        }

                        Layout.alignment: Qt.AlignCenter
                    }

                    Loader {
                        active: true
                        visible: true
                        sourceComponent: Power {
                            screen: scope.screen
                        }

                        Layout.alignment: Qt.AlignCenter
                    }
                }
            }
        }
    }
}
