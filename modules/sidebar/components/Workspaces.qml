import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import qs.configs
import qs.components
import qs.services

Loader {
    required property var screen

    id: root
    active: true
    visible: true
    sourceComponent: ColumnLayout {
        spacing: Config.sidebar.workspaces.spacing

        Rectangle {
            radius: Config.sidebar.workspaces.windowCount.radius
            color: Appearance.sidebar.workspaces.windowCount.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: Config.sidebar.workspaces.windowCount.size
            Layout.preferredWidth: Config.sidebar.workspaces.windowCount.size

            Icon {
                visible: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length == 0
                icon: GlobalIcons.layout_3_fill
                color: Appearance.sidebar.workspaces.windowCount.color
                size: Config.sidebar.workspaces.windowCount.iconSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }

            Text {
                visible: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length > 0
                text: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length
                color: Appearance.sidebar.workspaces.windowCount.color
                font.pointSize: Config.sidebar.workspaces.windowCount.fontSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }
        }

        Rectangle {
            radius: Config.sidebar.workspaces.indicators.radius
            color: Appearance.sidebar.workspaces.indicators.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: Config.sidebar.workspaces.indicators.size
            Layout.preferredHeight: (Config.sidebar.workspaces.indicators.size * Hyprland.workspaces.values.length) + (Config.sidebar.workspaces.indicators.spacing * (Hyprland.workspaces.values.length - 1))

            ColumnLayout {
                spacing: Config.sidebar.workspaces.indicators.spacing

                anchors {
                    centerIn: parent
                }

                Repeater {
                    model: Hyprland.workspaces

                    Item {
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: Config.sidebar.workspaces.indicators.size
                        Layout.preferredHeight: Config.sidebar.workspaces.indicators.size

                        Rectangle {
                            color: {
                                if (modelData.urgent) {
                                    return Appearance.sidebar.workspaces.indicators.indicator.urgent;
                                } else if ((modelData.id <= 0 || modelData.id > 10) && modelData.toplevels.values.length > 0) {
                                    return Appearance.sidebar.workspaces.indicators.indicator.specialSelected;
                                } else if (modelData.active) {
                                    return Appearance.sidebar.workspaces.indicators.indicator.selected;
                                } else {
                                    return Appearance.sidebar.workspaces.indicators.indicator.background;
                                }
                            }
                            radius: Config.sidebar.workspaces.indicators.radius

                            anchors {
                                fill: parent
                                margins: Config.sidebar.workspaces.indicators.indicator.margin
                            }

                            Text {
                                visible: modelData.id > 0 && modelData.id <= 10
                                text: modelData.id
                                color: Appearance.sidebar.workspaces.indicators.indicator.color
                                font.pointSize: Config.sidebar.workspaces.indicators.indicator.fontSize

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }

                            Icon {
                                visible: modelData.id <= 0 || modelData.id > 10
                                icon: GlobalIcons.asterisk_fill
                                color: Appearance.sidebar.workspaces.indicators.indicator.specialColor
                                font.pointSize: Config.sidebar.workspaces.indicators.indicator.specialFontSize

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
