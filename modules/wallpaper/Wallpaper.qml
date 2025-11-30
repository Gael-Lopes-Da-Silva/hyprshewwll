import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

import qs.configs
import qs.services

Loader {
    id: root
    active: true
    visible: true
    sourceComponent: Variants {
        model: Quickshell.screens

        Scope {
            required property var modelData

            id: wallpaper

            PanelWindow {
                screen: wallpaper.modelData
                color: "transparent"

                WlrLayershell.namespace: GlobalDatas.appId + "_wallpaper"
                WlrLayershell.exclusionMode: ExclusionMode.Ignore
                WlrLayershell.layer: WlrLayer.Background

                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                Loader {
                    active: !Config.wallpaper.animated
                    visible: !Config.wallpaper.animated
                    sourceComponent: Image {
                        asynchronous: true
                        source: Config.wallpaper.path
                    }

                    anchors {
                        fill: parent
                    }
                }

                Loader {
                    active: Config.wallpaper.animated
                    visible: Config.wallpaper.animated
                    sourceComponent: AnimatedImage {
                        asynchronous: true
                        source: Config.wallpaper.path
                    }

                    anchors {
                        fill: parent
                    }
                }
            }
        }
    }
}
