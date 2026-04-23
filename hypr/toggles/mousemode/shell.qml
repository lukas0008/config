import QtQuick
import QtQuick.Window
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

ShellRoot {
    id: shell
    property var actions: []

    RadialMenu {
        id: radial
        actions: shell.actions

        Component.onCompleted: {
            var cfg = Quickshell.env("RADIAL_CONFIG")
            if (cfg) {
                shell.actions = JSON.parse(cfg)
            }
        }

        onTriggered: (index) => {
            if (shell.actions[index]) {
                Hyprland.dispatch(shell.actions[index].command)
            }
        }
    }

    IpcHandler {
        target: "radial"

        function showAt(x: int, y: int): void {
            radial.openAt(x, y)
        }

        function hide(): void {
            radial.closeMenu()
        }

        function releaseMiddle(): void {
            radial.releaseMiddle()
        }

        function releaseAt(x: int, y: int): void {
            radial.releaseAt(x, y)
        }

        function clickAt(x: int, y: int): void {
            radial.clickAt(x, y)
        }

        function isVisible(): bool {
            return radial.opened
        }
    }
}
