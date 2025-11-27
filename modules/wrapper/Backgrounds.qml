import QtQuick
import QtQuick.Shapes
import QtQuick.Effects
import Quickshell

import qs.configs
import qs.services

Item {
    required property var screen

    id: root

    Shape {
        id: background
        visible: false
        preferredRendererType: Shape.CurveRenderer

        anchors {
            fill: parent
        }

        ShapePath {
            strokeColor: "transparent"
            fillColor: Appearance.wrapper.background
            fillRule: ShapePath.OddEvenFill

            startX: 0
            startY: 0

            PathLine { x: screen.width; y: 0 }
            PathLine { x: screen.width; y: screen.height }
            PathLine { x: 0; y: screen.height }
            PathLine { x: 0; y: 0 }

            PathMove {
                x: (GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize) + Config.wrapper.background.radius
                y: Config.wrapper.implicitSize
            }

            PathLine {
                x: (screen.width - Config.wrapper.implicitSize) - Config.wrapper.background.radius
                y: Config.wrapper.implicitSize
            }
            PathArc {
                x: (screen.width - Config.wrapper.implicitSize)
                y: Config.wrapper.implicitSize + Config.wrapper.background.radius
                radiusX: Config.wrapper.background.radius
                radiusY: Config.wrapper.background.radius
            }

            PathLine {
                x: screen.width - Config.wrapper.implicitSize
                y: (screen.height - Config.wrapper.implicitSize) - Config.wrapper.background.radius
            }
            PathArc {
                x: (screen.width - Config.wrapper.implicitSize) - Config.wrapper.background.radius
                y: screen.height - Config.wrapper.implicitSize
                radiusX: Config.wrapper.background.radius
                radiusY: Config.wrapper.background.radius
            }

            PathLine {
                x: (GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize) + Config.wrapper.background.radius
                y: screen.height - Config.wrapper.implicitSize
            }
            PathArc {
                x: (GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize)
                y: (screen.height - Config.wrapper.implicitSize) - Config.wrapper.background.radius
                radiusX: Config.wrapper.background.radius
                radiusY: Config.wrapper.background.radius
            }

            PathLine {
                x: GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize
                y: Config.wrapper.implicitSize + Config.wrapper.background.radius
            }
            PathArc {
                x: (GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize) + Config.wrapper.background.radius
                y: Config.wrapper.implicitSize
                radiusX: Config.wrapper.background.radius
                radiusY: Config.wrapper.background.radius
            }
        }
    }

    MultiEffect {
        source: background
        shadowEnabled: true

        anchors {
            fill: parent
        }
    }
}
