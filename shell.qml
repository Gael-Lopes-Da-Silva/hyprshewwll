import QtQuick
import Quickshell

import "modules"
import "modules/wrapper"
import "modules/sidebar"

ShellRoot {
    Wrapper {}
    Sidebar {}

    Shortcuts {}
}
