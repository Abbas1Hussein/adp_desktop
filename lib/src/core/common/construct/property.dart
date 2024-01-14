/// Base class for all specific Windows properties.
///
/// All specific Windows properties must extend this class.
///
/// See also:
///
/// * [Properties] Used to create Windows-specific properties.
/// * [PropertiesLogic] Used to create Windows-specific properties, applied only to the Windows platform.
abstract class CoreWindowsProperty {
  const CoreWindowsProperty();
}

/// Base class for all specific macOS properties.
///
/// All specific macOS properties must extend this class.
///
/// See also:
///
/// * [Properties] Used to create macOS-specific properties.
/// * [PropertiesLogic] Used to create macOS-specific properties, applied only to the macOS platform.
abstract class CoreMacosProperty {
  const CoreMacosProperty();
}
