pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string socketPath

    Socket {
        id: socket
        path: socketPath
    }

    Process {
        running: true
        command: ["echo", "$NIRI_SOCKET"]
        stdout: StdioCollector {
            id: socketPathCollector
            onStreamFinished: {
                root.socketPath = socketPathCollector.text;
                socket.connected = true
            }
        }
    }
}
