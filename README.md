Use this package to create adaptive apps on desktop. With just one codebase, you can preview your app on both Windows and macOS platforms, regardless of the device you're used.
### Platform-Specific Integration
- On MacOS: we use `macos_ui`
- On Windows: we use `fluent_ui`
- On Linux: for now we do not support, but you can choose between `fluent_ui` or `macos_ui`.
- On Web: you can choose between `fluent_ui` or `macos_ui`.

## Table of Contents

<details>
<summary>Buttons</summary>

### Basic Buttons

- [Button](#button)
- [Button Field](#field-button)
- [Button Outlined](#outlined-button)
- [Icon Button](#icon-button)
- [Text Button](#text-button)

### Menus

- [Pulldown Menu Button](#pulldown-menu-button)
- [Popup Menu Button](#popup-menu-button)

### Selection Buttons

- [Radio Button](#radio-button)
- [Switch Button](#switch-button)
- [Checkbox](#checkbox)

### Window Control Buttons

- [Window Buttons](#window-buttons)
  - [Close Window Button](#close-window-button)
  - [Minimize Window Button](#minimize-window-button)
  - [Maximize Window Button](#maximize-window-button)

### Navigation Buttons

- [Back Button](#back-button)
- [Close Button](#close-button)
</details>

<details>
<summary>Fields</summary>

  - [Text Field](#text-field)
  - [Text Form Field](#text-form-field)
  - [Text Search Field](#text-search-field)
</details>

<details>
<summary>Icon</summary>

  - [Icon](#icon)
  - [Icon Theme](#icon-theme)
  - [Icons](#icons)
</details>

<details>
<summary>Indicators</summary>

  - [Circular Progress Indicator](#circular-progress-indicator)
  - [Progress Bar](#progress-bar)
  - [Rating Indicator](#rating-indicator)
  - [Slider](#slider)
</details>

<details>
<summary>Layout</summary>

  - [Appbar](#appbar)
  - [Appbar Page](#appbar-page)
  - [Appbar Action](#appbar-action)
  - [Drawer](#drawer)
  - [Scaffold](#scaffold)
  - [Scaffold Page](#scaffold-page)
  - [Title Bar](#title-bar)
</details>

<details>
<summary>Navigation</summary>

  - [Navigation Appbar](#navigation-appbar)
  - [Navigation Sidebar](#navigation-sidebar)
  - [Navigation View](#navigation-view)
  - [Tab View](#tab-view)
</details>

<details>
<summary>Pickers</summary>

  - [Date Picker](#date-picker)
  - [Time Picker](#time-picker)
</details>

<details>
<summary>Surfaces</summary>

  - [Bottom Sheet](#bottom-sheet)
  - [Card](#card)
  - [Dialog](#dialog)
  - [Divider](#divider)
  - [List Tile](#list-tile)
  - [Tooltip](#tooltip)
</details>

<details>
<summary>Additional</summary>

  - [AdaptiveBuilder](#adaptive-builder)
  - [AdaptiveWidget](#adaptive-widget)
  - [AdaptiveBrightness](#adaptive-brightness)
  - [AdaptiveTypography](#adaptive-typography)
  - [Color's](#color)
  - [Transition's](#transition)
</details>


## Buttons

### Basic Buttons

#### Button

| MacOS Dark\Light Mode                         | Windows Dark\Light Mode                       |
| --------------------------------------------- | ----------------------------------------------|
| ![macOS Dark Mode](https://i.imgur.com/wlekjGT.png)  | ![Windows Dark Mode](https://i.imgur.com/mDwOl8z.png) |
| ![macOS Light Mode](https://i.imgur.com/U3BidaC.png) | ![Windows Light Mode](https://i.imgur.com/kTwO9Tz.png) |

```dart
/// base button
AdaptiveButton(
  child: const Text('Base Button'),
  onPressed: () {},
),

/// button field
AdaptiveButton.field(
  child: const Text('Field Button'),
  onPressed: () {},
),

/// outlined button
AdaptiveButton.outlined(
  child: const Text('Outlined Button'),
  onPressed: () {},
),
```

#### Icon Button
[Add a brief description and usage example for the Icon Button component]

#### Text Button
[Add a brief description and usage example for the Text Button component]

### Menus

#### Pulldown Menu Button
[Add a brief description and usage example for the Pulldown Menu Button component]

#### Popup Menu Button
[Add a brief description and usage example for the Popup Menu Button component]

### Selection Buttons

#### Radio Button

| MacOS Dark\Light Mode                         | Windows Dark\Light Mode                        |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/Z6xhZlh.gif)  | ![Windows Dark Mode](https://i.imgur.com/GG04BVJ.gif) |
| ![macOS Light Mode](https://i.imgur.com/rA8sOuH.gif) | ![Windows Light Mode](https://i.imgur.com/dnuTbIN.gif) |

```dart
AdaptiveRadio<SingingCharacter>(
  value: SingingCharacter.lafayette,
  groupValue: _character,
  onChanged: (SingingCharacter? newValue) {
    setState(() {
      _character = newValue;
    });
  },
),
```

#### Switch Button

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/07rssaU.gif) | ![Windows Dark Mode](https://i.imgur.com/QJY6f9R.gif) |
| ![macOS Light Mode](https://i.imgur.com/dU5CfsI.gif)| ![Windows Light Mode](https://i.imgur.com/3a3XRw4.gif) |

```dart
AdaptiveSwitch(
  value: _currentValue,
  onChanged: (bool newValue) {
    setState(() {
      _currentValue = newValue;
    });
  },
),
```

#### Checkbox

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/Vfe6kpO.gif) | ![Windows Dark Mode](https://i.imgur.com/02y0IHj.gif) |
| ![macOS Light Mode](https://i.imgur.com/NVYlXQQ.gif)| ![Windows Light Mode](https://i.imgur.com/H0h21lE.gif) |

```dart
AdaptiveSwitch(
  value: _currentValue,
  onChanged: (bool newValue) {
    setState(() {
      _currentValue = newValue;
    });
  },
),
```

### Window Control Buttons

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/Lmplu4c.png) | ![Windows Dark Mode](https://i.imgur.com/nzbXPU0.gif) |
| ![macOS Light Mode](https://i.imgur.com/ED5aC9z.png)| ![Windows Light Mode](https://i.imgur.com/EE15Dif.gif) |

#### Window Buttons

```dart
AdaptiveWindowButtons(),
```

##### Close Window Button

```dart
AdaptiveCloseButton(),
```

##### Minimize Window Button

```dart
AdaptiveMinimizeButton(),
```

##### Maximize Window Button

```dart
AdaptiveMaximizeButton(),
```

### Navigation Buttons

#### Back Button
[Add a brief description and usage example for the Back Button component]

#### Close Button
[Add a brief description and usage example for the Close Button component]

## Fields

### Text Field
[Add a brief description and usage example for the Text Field component]

### Text Form Field
[Add a brief description and usage example for the Text Form Field component]

### Text Search Field
[Add a brief description and usage example for the Text Search Field component]

## Icon

### Icon
[Add a brief description and usage example for the Icon component]

### Icon Theme
[Add a brief description and usage example for the Icon Theme component]

### Icons
[Add a brief description and usage example for the Icons component]

## Indicators

### Circular Progress Indicator
[Add a brief description and usage example for the Circular Progress Indicator component]

### Progress Bar
[Add a brief description and usage example for the Progress Bar component]

### Rating Indicator
[Add a brief description and usage example for the Rating Indicator component]

### Slider
[Add a brief description and usage example for the Slider component]

## Layout

### Appbar
[Add a brief description and usage example for the Appbar component]

### Appbar Page
[Add a brief description and usage example for the Appbar Page component]

### Appbar Action
[Add a brief description and usage example for the Appbar Action component]

### Drawer
[Add a brief description and usage example for the Drawer component]

### Scaffold
[Add a brief description and usage example for the Scaffold component]

### Scaffold Page
[Add a brief description and usage example for the Scaffold Page component]

### Title Bar
[Add a brief description and usage example for the Title Bar component]

## Navigation

### Navigation Appbar
[Add a brief description and usage example for the Navigation Appbar component]

### Navigation Sidebar
[Add a brief description and usage example for the Navigation Sidebar component]

### Navigation View
[Add a brief description and usage example for the Navigation View component]

### Tab View
[Add a brief description and usage example for the Tab View component]

## Pickers

### Date Picker
[Add a brief description and usage example for the Date Picker component]

### Time Picker
[Add a brief description and usage example for the Time Picker component]

## Surfaces

### Bottom Sheet
[Add a brief description and usage example for the Bottom Sheet component]

### Card
[Add a brief description and usage example for the Card component]

### Dialog
[Add a brief description and usage example for the Dialog component]

### Divider
[Add a brief description and usage example for the Divider component]

### List Tile
[Add a brief description and usage example for the List Tile component]

### Tooltip
[Add a brief description and usage example for the Tooltip component]

## Transitions

### Entrance Transition
[Add a brief description and usage example for the Entrance Transition component]

### Horizontal Slide Transition
[Add a brief description and usage example for the Horizontal Slide Transition component]

### Page Transition
[Add a brief description and usage example for the Page Transition component]
