import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import qs.configs
import qs.components
import qs.services

ColumnLayout {
    required property var screen

    id: root

    Rectangle {
        radius: Config.sidebar.clock.radius
        color: Appearance.sidebar.clock.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: clockColumn.height
        Layout.preferredWidth: Config.sidebar.clock.size

        Rectangle {
            color: "transparent"
            radius: Config.sidebar.clock.radius

            anchors {
                fill: parent
                margins: Config.sidebar.clock.button.margin
            }

            ColumnLayout {
                id: clockColumn
                spacing: Config.sidebar.clock.spacing

                anchors {
                    centerIn: parent
                }

                Item {
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: Config.sidebar.clock.size
                    Layout.preferredHeight: Config.sidebar.clock.size

                    Icon {
                        icon: GlobalIcons.time_fill
                        color: Appearance.sidebar.clock.button.iconColor
                        size: Config.sidebar.clock.button.iconSize

                        anchors {
                            centerIn: parent
                            alignWhenCentered: false
                        }
                    }
                }

                Item {
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: Config.sidebar.clock.size
                    Layout.preferredHeight: clockHoursText.height
                    Layout.bottomMargin: 8

                    Text {
                        id: clockHoursText
                        text: Qt.formatDateTime(clockHours.date, Config.sidebar.clock.showSeconds ? (Config.sidebar.clock.useTwelveHourClock ? "hh\nmm\nss\nA" : "hh\nmm\nss") : (Config.sidebar.clock.useTwelveHourClock ? "hh\nmm\nA" : "hh\nmm"))
                        color: Appearance.sidebar.clock.button.color
                        font.pointSize: Config.sidebar.clock.button.fontSize

                        anchors {
                            centerIn: parent
                            alignWhenCentered: false
                        }

                        SystemClock {
                            id: clockHours
                            precision: Config.sidebar.clock.showSeconds ? SystemClock.Seconds : SystemClock.Minutes
                        }
                    }
                }
            }

            MouseArea {
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                anchors {
                    fill: parent
                }

                onEntered: parent.color = Appearance.sidebar.clock.button.hovered
                onExited: parent.color = "transparent"
            }
        }
    }
}
