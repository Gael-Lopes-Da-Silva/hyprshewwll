import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

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
                x: GlobalDatas.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize
                y: Config.wrapper.implicitSize
                width: modelData.width - (GlobalDatas.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize) - Config.wrapper.implicitSize
                height: modelData.height - Config.wrapper.implicitSize * 2
                intersection: Intersection.Xor
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
