import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.modules
import qs.modules.wrapper
import qs.modules.sidebar

ShellRoot {
    Loader {
        active: !Hyprland.focusedMonitor.activeWorkspace.hasFullscreen
        visible: !Hyprland.focusedMonitor.activeWorkspace.hasFullscreen
        sourceComponent: Item {
            Sidebar {}
            Wrapper {}
        }
    }

    Shortcuts {}
}
