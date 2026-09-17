import QtQuick 2.14
import QtQuick.Layouts 1.14
import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.faces as Faces

Faces.CompactSensorFace {
    id: root

    readonly property int barCount: controller.highPrioritySensorIds.length
    readonly property int barWidth: controller.faceConfiguration.barWidth ?? 6
    readonly property int barSpacing: controller.faceConfiguration.barSpacing ?? 1
    readonly property bool showBarBackground: controller.faceConfiguration.showBarBackground ?? true

    readonly property int totalWidth: barCount * barWidth + (barCount - 1) * barSpacing + 4
    Layout.minimumWidth: totalWidth
    implicitWidth: totalWidth
    Layout.minimumHeight: Kirigami.Units.iconSizes.small

    contentItem: Item {
        anchors.fill: parent

        Row {
            id: barRow
            anchors.fill: parent
            spacing: barSpacing

            Repeater {
                model: root.controller.highPrioritySensorIds

                Item {
                    width: root.barWidth
                    height: barRow.height

                    Sensors.Sensor {
                        id: sensor
                        sensorId: modelData
                        updateRateLimit: root.controller.updateRateLimit
                    }

                    readonly property real rangeFrom: root.controller.faceConfiguration.rangeAuto ? sensor.minimum : (root.controller.faceConfiguration.rangeFrom * root.controller.faceConfiguration.rangeFromMultiplier)
                    readonly property real rangeTo: root.controller.faceConfiguration.rangeAuto ? sensor.maximum : (root.controller.faceConfiguration.rangeTo * root.controller.faceConfiguration.rangeToMultiplier)
                    readonly property real normalizedValue: {
                        if (rangeTo === rangeFrom) return 0;
                        return Math.max(0, Math.min(1, (sensor.value - rangeFrom) / (rangeTo - rangeFrom)));
                    }

                    Rectangle {
                        anchors.fill: parent
                        visible: root.showBarBackground
                        color: Kirigami.ColorUtils.linearInterpolation(Kirigami.Theme.backgroundColor, Kirigami.Theme.textColor, 0.1)
                        radius: 1
                        opacity: 0.3
                    }

                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        height: parent.height * normalizedValue
                        color: root.colorSource.map[modelData] ?? Kirigami.Theme.highlightColor
                        radius: 1
                        smooth: true

                        Behavior on height {
                            NumberAnimation { duration: 150; easing.type: Easing.InOutQuad }
                        }
                    }
                }
            }
        }
    }
}