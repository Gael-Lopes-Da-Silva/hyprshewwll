import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.configs
import qs.components
import qs.services

ColumnLayout {
    required property var screen

    id: root

    Rectangle {
        radius: Config.sidebar.systemTray.radius
        color: Appearance.sidebar.systemTray.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: systemTrayColumn.height
        Layout.preferredWidth: Config.sidebar.systemTray.size

        ColumnLayout {
            id: systemTrayColumn
            spacing: 0

            Repeater {
                model: SystemTray.items

                Item {
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: Config.sidebar.systemTray.size
                    Layout.preferredWidth: Config.sidebar.systemTray.size

                    Rectangle {
                        color: "transparent"
                        radius: Config.sidebar.systemTray.radius

                        anchors {
                            fill: parent
                            margins: Config.sidebar.systemTray.button.margin
                        }

                        IconImage {
                            implicitWidth: Config.sidebar.systemTray.button.iconSize
                            implicitHeight: Config.sidebar.systemTray.button.iconSize
                            source: {
                                if (modelData.icon.includes("?path=")) {
                                    const [name, path] = modelData.icon.split("?path=");
                                    return Qt.resolvedUrl(`${path}/${name.slice(name.lastIndexOf("/") + 1)}`);
                                }

                                return modelData.icon;
                            }

                            anchors {
                                centerIn: parent
                                alignWhenCentered: false
                            }
                        }

                        MouseArea {
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            acceptedButtons: Qt.LeftButton | Qt.RightButton

                            anchors {
                                fill: parent
                            }

                            onEntered: parent.color = Appearance.sidebar.systemTray.button.hovered
                            onExited: parent.color = "transparent"
                            onClicked: (event) => {
                                if (event.button === Qt.LeftButton) {
                                    modelData.activate();
                                } else {
                                    modelData.secondaryActivate();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
