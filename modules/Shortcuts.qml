import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.services

Item {
    id: root

    GlobalShortcut {
        appid: GlobalDatas.appId
        name: "toggleSidebar"
        description: "Toggle sidebar"

        onPressed: {
            GlobalStates.showSidebar = !GlobalStates.showSidebar;
        }
    }
}
