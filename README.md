<a name="english"></a>
<details open>
   <summary><b>English</b></summary>

# Vertical CPU Bars for KDE Plasma

A sensor face for the KDE Plasma **System Monitor** widget that displays CPU core usage as compact vertical bars. Especially useful for multi-core CPUs (16+ threads), where the standard horizontal bars don't fit nicely in a panel.

## Preview

![Vertical CPU Bars in a Plasma panel](preview.gif)

*Panel mode with 16 CPU threads.*

## Features

- Vertical bars for each CPU core
- Adjustable bar width and spacing
- Optional background under each bar

## Installation

### Manual installation

1. Download the latest release from the [Releases page](https://github.com/Rusaell/plasma-vertical-cpu-bars/releases).
2. Extract the archive into:
   ```bash
   ~/.local/share/ksysguard/sensorfaces/
   ```
3. Restart Plasma:
   ```bash
   plasmashell --replace &
   ```
4. Add or edit a System Monitor widget and select **Vertical CPU Bars** as the display style.

## Configuration

In the widget settings you can adjust:

- **Automatic data range** — use the sensor's natural min/max.
- **Bar width (px)** — width of each vertical bar.
- **Spacing (px)** — gap between bars.
- **Show background** — draw a subtle background behind each bar.
- **Reset to defaults** — restore all settings.

## Requirements

- KDE Plasma 6 (or Plasma 5 with KSystemGuard 5.27+).
- Works on any distribution (tested on Artix Linux with OpenRC).
</details>
<a name="russian"></a>
<details open>
   <summary><b>Русский</b></summary>
   
# Вертикальные столбцы CPU для KDE Plasma

Стиль отображения для виджета **Системный монитор** в KDE Plasma, который показывает загрузку ядер процессора в виде компактных вертикальных столбцов. Особенно удобен для многоядерных CPU, где стандартные горизонтальные столбцы не помещаются в панель.

## Превью

![Вертикальные столбцы CPU в панели Plasma](preview.gif)

*Режим панели с 16 потоками CPU.*

## Возможности

- Вертикальные столбцы для каждого ядра
- Настройка ширины и расстояния между столбцами
- Опциональный фон

## Установка

### Ручная установка

1. Скачайте последний релиз со [страницы релизов](https://github.com/Rusaell/plasma-vertical-cpu-bars/releases).
2. Распакуйте архив в:
   ```bash
   ~/.local/share/ksysguard/sensorfaces/
   ```
3. Перезапустите Plasma:
   ```bash
   plasmashell --replace &
   ```
4. Добавьте или отредактируйте виджет «Системный монитор» и выберите **Вертикальные столбцы CPU** как стиль отображения.

## Настройка

В настройках виджета можно изменить:

- **Автоматический диапазон данных** — использовать естественные min/max сенсора.
- **Ширина столбцов (пикс)** — ширину вертикальных столбцов.
- **Расстояние (пикс)** — промежуток между столбцами.
- **Показывать фон** — отображение фона за каждым столбцом.
- **Сбросить к значениям по умолчанию** — вернуть все настройки.

## Требования

- KDE Plasma 6 (или Plasma 5 с KSystemGuard 5.27+).
- Работает на любом дистрибутиве (протестировано на Artix Linux с OpenRC).
</details>
