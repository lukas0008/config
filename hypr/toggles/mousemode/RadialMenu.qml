import QtQuick
import QtQuick.Window
import Quickshell

PanelWindow {
    id: root

    property var actions: []
    property int selectedIndex: -1
    property real innerRadius: 25
    property real outerRadius: 140
    property point center: Qt.point(0, 0)
    readonly property int itemCount: actions.length

    property bool lmbClicked: false
    property bool opened: false

    signal triggered(int index)

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    exclusionMode: ExclusionMode.Ignore
    aboveWindows: true
    focusable: false

    color: "transparent"
    visible: false

    function openAt(x, y) {
        center = Qt.point(x, y)
        visible = true
        opened = true
        selectedIndex = -1
        lmbClicked = false
    }

    function selectionFor(x, y) {
        if (itemCount === 0) return -1

        let dx = x - center.x
        let dy = y - center.y
        let angle = Math.atan2(dy, dx)
        let sliceSize = (2 * Math.PI) / itemCount
        let adjusted = angle + sliceSize / 2
        if (adjusted < 0) adjusted += 2 * Math.PI

        return Math.floor(adjusted / sliceSize) % itemCount
    }

    function updateSelection(x, y) {
        selectedIndex = selectionFor(x, y)
    }

    function closeMenu() {
        visible = false
        opened = false
    }

    function releaseMiddle() {
        if (!opened) return

        if (!lmbClicked && selectedIndex >= 0) {
            triggered(selectedIndex)
        }

        closeMenu()
    }

    function releaseAt(x, y) {
        updateSelection(x, y)
        releaseMiddle()
    }

    function clickAt(x, y) {
        if (!opened) return

        updateSelection(x, y)

        if (selectedIndex >= 0) {
            lmbClicked = true
            triggered(selectedIndex)
        }

        closeMenu()
    }

    MouseArea {
        id: menuArea
        anchors.fill: parent
        hoverEnabled: true

        acceptedButtons: Qt.LeftButton

        onPositionChanged: {
            root.updateSelection(mouse.x, mouse.y)
        }

        onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton && root.selectedIndex >= 0) {
                root.triggered(root.selectedIndex)
                root.lmbClicked = true
                root.closeMenu()
            }
        }

    }

    Canvas {
        id: sectors
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()

            var n = root.itemCount
            if (n === 0) return

            var sliceSize = (2 * Math.PI) / n

            for (var i = 0; i < n; i++) {
                var startAngle = i * sliceSize - sliceSize / 2
                var endAngle = startAngle + sliceSize

                ctx.beginPath()
                ctx.arc(root.center.x, root.center.y, root.outerRadius, startAngle, endAngle)
                ctx.arc(root.center.x, root.center.y, root.innerRadius, endAngle, startAngle, true)
                ctx.closePath()

                ctx.fillStyle = root.selectedIndex === i ? "rgba(136,192,208,1)" : "rgba(51,51,51,0.9)"
                ctx.fill()

                ctx.strokeStyle = "#888"
                ctx.lineWidth = 1.5
                ctx.setLineDash([4, 4])
                ctx.stroke()
            }
        }

        Connections {
            target: root
            function onSelectedIndexChanged() { sectors.requestPaint() }
            function onVisibleChanged() { sectors.requestPaint() }
        }
    }

    Repeater {
        model: itemCount

        Text {
            property real midAngle: index * (2 * Math.PI) / itemCount
            property real labelRadius: (root.innerRadius + root.outerRadius) / 2

            x: root.center.x + labelRadius * Math.cos(midAngle) - width / 2
            y: root.center.y + labelRadius * Math.sin(midAngle) - height / 2

            text: root.actions[index] ? root.actions[index].label : ""
            color: "white"
            font.pixelSize: 13
        }
    }

    Rectangle {
        width: 20
        height: 20
        radius: 10
        color: xBtnMa.containsMouse ? "#c06060" : "#444"
        x: center.x - 10
        y: center.y - 10

        Text {
            anchors.centerIn: parent
            text: "✕"
            color: "white"
            font.pixelSize: 12
        }

        MouseArea {
            id: xBtnMa
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.closeMenu()
        }
    }
}
