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
        radius: Config.sidebar.status.radius
        color: Appearance.sidebar.status.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: statusColumn.height
        Layout.preferredWidth: Config.sidebar.status.size

        ColumnLayout {
            id: statusColumn
            spacing: 0

            Loader {
                active: true
                visible: true
                sourceComponent: Item {
                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        color: "transparent"
                        radius: Config.sidebar.status.radius

                        anchors {
                            fill: parent
                            margins: Config.sidebar.status.button.margin
                        }

                        Icon {
                            icon: GlobalIcons.wifi_fill
                            color: Appearance.sidebar.status.button.color
                            size: Config.sidebar.status.button.iconSize

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

                            onEntered: parent.color = Appearance.sidebar.status.button.hovered
                            onExited: parent.color = "transparent"
                        }
                    }
                }

                Layout.alignment: Qt.AlignCenter
                Layout.preferredHeight: Config.sidebar.status.size
                Layout.preferredWidth: Config.sidebar.status.size
            }

            Loader {
                active: true
                visible: true
                sourceComponent: Item {
                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        color: "transparent"
                        radius: Config.sidebar.status.radius

                        anchors {
                            fill: parent
                            margins: Config.sidebar.status.button.margin
                        }

                        Icon {
                            icon: GlobalIcons.bluetooth_fill
                            color: Appearance.sidebar.status.button.color
                            size: Config.sidebar.status.button.iconSize

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

                            onEntered: parent.color = Appearance.sidebar.status.button.hovered
                            onExited: parent.color = "transparent"
                        }
                    }
                }

                Layout.alignment: Qt.AlignCenter
                Layout.preferredHeight: Config.sidebar.status.size
                Layout.preferredWidth: Config.sidebar.status.size
            }

            Loader {
                active: true
                visible: true
                sourceComponent: Item {
                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        color: "transparent"
                        radius: Config.sidebar.status.radius

                        anchors {
                            fill: parent
                            margins: Config.sidebar.status.button.margin
                        }

                        Icon {
                            icon: GlobalIcons.battery_fill
                            color: Appearance.sidebar.status.button.color
                            size: Config.sidebar.status.button.iconSize

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

                            onEntered: parent.color = Appearance.sidebar.status.button.hovered
                            onExited: parent.color = "transparent"
                        }
                    }
                }

                Layout.alignment: Qt.AlignCenter
                Layout.preferredHeight: Config.sidebar.status.size
                Layout.preferredWidth: Config.sidebar.status.size
            }
        }
    }
}
