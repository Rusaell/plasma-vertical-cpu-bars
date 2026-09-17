import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.faces as Faces

Kirigami.FormLayout {
    property alias cfg_rangeAuto: rangeAutoCheckbox.checked
    property alias cfg_rangeFrom: rangeFromSpin.value
    property alias cfg_rangeFromUnit: rangeFromSpin.unit
    property alias cfg_rangeFromMultiplier: rangeFromSpin.multiplier
    property alias cfg_rangeTo: rangeToSpin.value
    property alias cfg_rangeToUnit: rangeToSpin.unit
    property alias cfg_rangeToMultiplier: rangeToSpin.multiplier
    property alias cfg_barWidth: barWidthSpin.value
    property alias cfg_barSpacing: barSpacingSpin.value
    property alias cfg_showBarBackground: showBackgroundCheckbox.checked

    // Функция локализации: английский по умолчанию, русский при русской локали
    function _(en, ru) {
        return Qt.locale().name.startsWith("ru") ? ru : en;
    }

    // ---- Блок диапазона ----
    QQC2.CheckBox {
        id: rangeAutoCheckbox
        text: _("Automatic data range", "Автоматический диапазон данных")
    }
    Faces.SensorRangeSpinBox {
        id: rangeFromSpin
        Kirigami.FormData.label: _("From:", "От:")
        Layout.preferredWidth: Kirigami.Units.gridUnit * 10
        enabled: !rangeAutoCheckbox.checked
        sensors: controller.highPrioritySensorIds
    }
    Faces.SensorRangeSpinBox {
        id: rangeToSpin
        Kirigami.FormData.label: _("To:", "До:")
        Layout.preferredWidth: Kirigami.Units.gridUnit * 10
        enabled: !rangeAutoCheckbox.checked
        sensors: controller.highPrioritySensorIds
    }

    Kirigami.Separator {
        Layout.fillWidth: true
        Layout.columnSpan: 2
    }

    // ---- Блок внешнего вида панели ----
    QQC2.Label {
        text: _("Panel appearance", "Внешний вид панели")
        font.bold: true
        Layout.columnSpan: 2
    }

    QQC2.SpinBox {
        id: barWidthSpin
        Kirigami.FormData.label: _("Bar width (px):", "Ширина столбцов (пикс):")
        from: 2
        to: 20
        value: 6
        editable: true
        Layout.preferredWidth: Kirigami.Units.gridUnit * 5
    }

    QQC2.SpinBox {
        id: barSpacingSpin
        Kirigami.FormData.label: _("Spacing (px):", "Расстояние (пикс):")
        from: 0
        to: 10
        value: 1
        editable: true
        Layout.preferredWidth: Kirigami.Units.gridUnit * 5
    }

    QQC2.CheckBox {
        id: showBackgroundCheckbox
        text: _("Show background", "Показывать фон")
        checked: true
    }

    // ---- Кнопка сброса ----
    RowLayout {
        Layout.columnSpan: 2
        Layout.fillWidth: true
        Layout.topMargin: Kirigami.Units.largeSpacing

        QQC2.Button {
            Layout.alignment: Qt.AlignHCenter
            text: _("Reset to defaults", "Сбросить к значениям по умолчанию")
            icon.name: "edit-undo"
            onClicked: {
                rangeAutoCheckbox.checked = true;
                rangeFromSpin.value = 0;
                rangeToSpin.value = 100;
                barWidthSpin.value = 6;
                barSpacingSpin.value = 1;
                showBackgroundCheckbox.checked = true;
            }
        }
    }
}