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

| Dark Mode                                     | Light Mode                                    |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://gist.github.com/assets/112737126/fe3da75e-e4cd-46b9-8af1-c59ba2d87acd) | ![macOS Light Mode](https://gist.github.com/assets/112737126/499cc3c2-6a54-4b4c-bfee-db902fab7e50) |
| ![Windows Dark Mode](https://gist.github.com/assets/112737126/5292da7b-3960-4c4e-a339-0b5605c28999) | ![Windows Light Mode](https://gist.github.com/assets/112737126/5d42bf94-c81e-4f4f-aa87-b72e8290dee1) |

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

| Dark Mode                                      | Light Mode                                     |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://gist.github.com/assets/112737126/85748e1e-c1d3-40c2-8b33-781108c28d0d) | ![macOS Light Mode](https://gist.github.com/assets/112737126/d46af09c-e155-4b82-9f11-44b21e5b3fe4) |
| ![Windows Dark Mode](https://gist.github.com/assets/112737126/0580dd2a-c468-47ab-a315-8c51cc68dcf0) | ![Windows Light Mode](https://gist.github.com/assets/112737126/169fb8bf-ba95-459d-86f3-db97617baa02) |

 ```dart
AdaptiveRadio<SingingCharacter>(
  value: SingingCharacter.lafayette,
  groupValue: _character,
  onChanged: (SingingCharacter? newValue) {
    setState(() {
      _character = newValue;
    });
  },
)

#### Switch Button
[Add a brief description and usage example for the Switch Button component]

#### Checkbox
[Add a brief description and usage example for the Checkbox component]

### Window Control Buttons

#### Window Buttons

##### Close Window Button
[Add a brief description and usage example for the Close Window Button component]

##### Minimize Window Button
[Add a brief description and usage example for the Minimize Window Button component]

##### Maximize Window Button
[Add a brief description and usage example for the Maximize Window Button component]

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
