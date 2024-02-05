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
- [Icon Button](#icon-button)
- [Text Button](#text-button)

### Menus

- [Pulldown Menu Button](#pulldown-menu-button)
- [Popup Menu Button](#popup-menu-button)

### Selection Buttons

- [Checkbox](#checkbox)
- [Switch Button](#switch-button)
- [Radio Button](#radio-button)


### Window Control Buttons

<a href="#window-buttons-section">Window Buttons</a>
<ul>
    <li><a href="#close-window-button-section">Close Window Button</a></li>
    <li><a href="#minimize-window-button-section">Minimize Window Button</a></li>
    <li><a href="#maximize-window-button-section">Maximize Window Button</a></li>
</ul>


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
It is one of the most widely used buttons in the flutter library typically contains an icon.
It is commonly used to trigger actions or events in response to user interaction, such as tapping or clicking.
If the onPressed callback is null, then the button will be disabled and will not react to touch.

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/j0diwNZ.gif) | ![Windows Dark Mode](https://i.imgur.com/Jg34uWa.gif) |
| ![macOS Light Mode](https://i.imgur.com/RNtTaPj.gif)| ![Windows Light Mode](https://i.imgur.com/L5nxThO.gif) |

```dart
AdaptiveIconButton(
  onPressed: () {},
  icon: const AdaptiveIcon(AdpIcons.add),
),
```

#### Text Button
A textButton widget is just a text label displayed on a zero-elevation Material widget.
By default, it does’t have visible borders and reacts to touches by filling with a background color.
If the onPressed && onLongPress callbacks is null, then the button will be disabled and will not react to touch.

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/AACRjIF.gif) | ![Windows Dark Mode](https://i.imgur.com/OGYr2Cs.gif) |
| ![macOS Light Mode](https://i.imgur.com/dPmGfwF.gif)| ![Windows Light Mode](https://i.imgur.com/qnor9Kz.gif) |

```dart
AdaptiveTextButton(
  onPressed: () {},
  child: const Text('Text Button'),
),
```


### Menus

#### Pulldown Menu Button
A pull-down menu button is used to create a nice overlay on the screen, allowing the user to select an item from multiple options.
The `AdaptivePulldownMenuButton.singleChoice` constructor option focuses on only one `AdaptivePulldownMenuItem`.
If `enabled` is true, it will be focused. There should be exactly one item with the specified 'enabled' value set to true.

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/SGmnHoa.gif) | ![Windows Dark Mode](https://i.imgur.com/N1Zp8Zl.gif) |
| ![macOS Light Mode](https://i.imgur.com/57xFA6e.gif)| ![Windows Light Mode](https://i.imgur.com/1lm4qAr.gif) |

```dart
AdaptivePulldownMenuButton(
  title: 'pulldown menu',
  items: [
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.folderAdd),
      child: Text('New folder'),
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.folderOpen),
      child: Text('Open'),
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.wand),
      child: Text('Open with'),
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.delete),
      child: Text('Remove'),
      enabled: false, // this will disabled.
    ),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.phone),
      child: Text('Import from phone ...'),
    ),
    AdaptivePulldownMenuDivider(),
    AdaptivePulldownMenuItem(
      leading: AdaptiveIcon(AdpIcons.star),
      child: Text('Give us a star'),
    ),
  ],
),
```

#### Popup Menu Button
A pop-up button (often referred to as a pop-up menu) is a type of button
that, when clicked, displays a menu containing a list of mutually exclusive choices.
A pop-up button includes a double-arrow indicator that alludes to the
direction in which the menu will appear (only vertical is currently supported).

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/0ytIHbt.gif) | ![Windows Dark Mode](https://i.imgur.com/kRwOboQ.gif) |
| ![macOS Light Mode](https://i.imgur.com/3LtfgAV.gif)| ![Windows Light Mode](https://i.imgur.com/tJgahz2.gif) |

```dart
AdaptivePopupMenuButton<int>(
  value: _currentValue,
  onChanged: (value) {
    setState(() {
      _currentValue = value!;
    });
  },
  items: const [
    AdaptivePopupMenuItem(value: 0, child: Text('Blue')),
    AdaptivePopupMenuItem(value: 1, child: Text('Green')),
    AdaptivePopupMenuItem(value: 2, child: Text('Red')),
    AdaptivePopupMenuItem(value: 3, child: Text('Yellow')),
    AdaptivePopupMenuItem(value: 4, child: Text('Purple')),
    AdaptivePopupMenuItem(value: 5, child: Text('Orange')),
  ],
),
```

### Selection Buttons

#### Checkbox
A checkbox is a type of button that lets the user choose between
two opposite states, actions, or values. A selected checkbox is
considered on when it contains a checkmark and off when it's empty.
A checkbox is almost always followed by a title unless it appears in
a checklist.

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/Vfe6kpO.gif) | ![Windows Dark Mode](https://i.imgur.com/02y0IHj.gif) |
| ![macOS Light Mode](https://i.imgur.com/NVYlXQQ.gif)| ![Windows Light Mode](https://i.imgur.com/H0h21lE.gif) |

```dart
AdaptiveCheckbox(
  value: _checkboxValue,
  onChanged: (value) {
    setState(() {
      _checkboxValue = value;
    });
  },
),
```

#### Switch Button
The switch represents a physical switch that allows users to turn
things on or off, like a light switch. Use switch controls to present
users with two mutually exclusive options (such as on/off), where choosing an option provides immediate results.
Use a switch for binary operations that take effect right after the
user flips the switch,Think of the switch as a physical power switch for a device: you flip
it on or off when you want to enable or disable the action performed by the device.

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

#### Radio Button
Also called option buttons, let users select one option from
a collection of two or more mutually exclusive, but related, options. Radio
buttons are always used in groups, and each option is represented by one radio button in the group.
In the default state, no radio button in a RadioButtons group is selected.
That is, all radio buttons are cleared. However, once a user has selected a
radio button, the user can't deselect the button to restore the group to its
initial cleared state.
The singular behavior of a RadioButtons group distinguishes it from check
boxes, which support multi-selection and deselection, or clearing.

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

### Window Control Buttons
<a id="window-buttons-section"></a>

Window control buttons are essential elements of any graphical user interface. They allow users to interact with and manage windows on their operating system. Each operating system provides its own set of control buttons, designed to seamlessly integrate with the system's aesthetics.

| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/Lmplu4c.png) | ![Windows Dark Mode](https://i.imgur.com/nzbXPU0.gif) |
| ![macOS Light Mode](https://i.imgur.com/ED5aC9z.png)| ![Windows Light Mode](https://i.imgur.com/EE15Dif.gif) |

```dart
AdaptiveWindowButtons(),
```

The `AdaptiveWindowButtons` widget provides a set of window control buttons. These buttons can be customized according to your preferences and requirements.

<a id="close-window-button-section"></a>
The close window button is used to terminate or close the active window.

```dart
AdaptiveCloseButton(),
```
<a id="minimize-window-button-section"></a>
The minimize window button is used to minimize the active window, reducing it to an icon on the taskbar or dock.

```dart
AdaptiveMinimizeButton(),
```
<a id="maximize-window-button-section"></a>
The maximize window button is used to maximize or expand the active window to fill the entire screen.

```dart
AdaptiveMaximizeButton(),
```

### Navigation Buttons

#### Back Button

```dart
AdaptiveBackButton(),
```
#### Close Button

```dart
AdaptiveBackButton(),
```
## Fields

### Text Field
| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/Gd9Dahe.gif) | ![Windows Dark Mode](https://i.imgur.com/GsKJgvf.gif) |
| ![macOS Light Mode](https://i.imgur.com/cPCO1yU.gif)| ![Windows Light Mode](https://i.imgur.com/yNLZMHD.gif) |

```dart
AdaptiveTextField(),
```

### Text Form Field
| MacOS Dark\Light Mode                         | Windows  Dark\Light Mode                       |
| --------------------------------------------- | ---------------------------------------------- |
| ![macOS Dark Mode](https://i.imgur.com/XL0VgKD.gif) | ![Windows Dark Mode](https://i.imgur.com/WHNQ53L.gif) |
| ![macOS Light Mode](https://i.imgur.com/sM52c6F.gif)| ![Windows Light Mode](https://i.imgur.com/n4EwHDz.gif) |

```dart
Form(
  key: _formKey,
  child: AdaptiveTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    onFieldSubmitted: (value) {
      _formKey.currentState?.validate();
    },
  ),
),
```

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
