import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.faces as Faces

ProgressBar {
    id: bar
    Layout.fillWidth: true

    property Sensors.Sensor sensor
    property Faces.SensorFaceController controller
    property color color

    readonly property real rangeFrom: controller.faceConfiguration.rangeFrom * controller.faceConfiguration.rangeFromMultiplier
    readonly property real rangeTo: controller.faceConfiguration.rangeTo * controller.faceConfiguration.rangeToMultiplier

    value: sensor?.value ?? 0
    from: controller.faceConfiguration.rangeAuto ? sensor.minimum : rangeFrom
    to: controller.faceConfiguration.rangeAuto ? sensor.maximum : rangeTo

    topPadding: topInset
    bottomPadding: bottomInset

    contentItem: Item {
        Rectangle {
            width: bar.visualPosition * parent.width
            height: parent.height
            color: bar.color
            radius: height / 2
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: Kirigami.Units.largeSpacing
        color: Kirigami.ColorUtils.linearInterpolation(Kirigami.Theme.backgroundColor, Kirigami.Theme.textColor, 0.1)
        radius: height / 2
    }
}