import QtQuick
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

        Exclusions {
            screen: root.modelData
        }

        PanelWindow {
            screen: root.modelData
            color: "transparent"

            WlrLayershell.namespace: GlobalDatas.appId + "_wrapper"
            WlrLayershell.exclusionMode: ExclusionMode.Ignore

            anchors {
                top: true
                left: true
                right: true
                bottom: true
            }

            mask: Region {
                item: mask
                intersection: Intersection.Xor
            }

            Rectangle {
                id: mask
                color: "transparent"

                anchors {
                    fill: parent
                    topMargin: Config.wrapper.implicitSize
                    leftMargin: GlobalDatas.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize
                    rightMargin: Config.wrapper.implicitSize
                    bottomMargin: Config.wrapper.implicitSize
                }
            }

            Backgrounds {
                screen: root.modelData

                anchors {
                    fill: parent
                }
            }
        }
    }
}
