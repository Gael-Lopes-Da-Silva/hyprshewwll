import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData

                screen: modelData
                anchors.bottom: true
                height: 40
                width: 200

                color: "transparent"

                Rectangle  {
                    anchors.fill: parent

                    topLeftRadius: 15
                    topRightRadius: 15
                    color: "black"

                    Text {
                        anchors.centerIn: parent
                        text: "test"
                        color: "white"
                    }
                }
            }
        }
    }
}
