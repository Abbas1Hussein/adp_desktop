import 'package:fluent_ui/fluent_ui.dart';

import '../../components/components.dart';
import '../common/construct/properties.dart';
import '../exception/property_exceptions.dart';

abstract final class AllProperties {
  const AllProperties(this._object);

  final Object? _object;

  get flatButtonProperty;

  get iconButtonProperty;

  get pulldownMenuProperty;

  get navigationViewProperty;

  get tabViewProperty;

  get dialogProperty;

  T _property<T>() {
    final isMismatch = _object.runtimeType != T;

    if (isMismatch) {
      final expectedTypeName = _object.runtimeType
          .toString()
          .lowercaseFirst()
          .replaceAll('Windows', '')
          .replaceAll('Macos', '');

      final instanceTypeName = T
          .toString()
          .lowercaseFirst()
          .replaceAll('Windows', '')
          .replaceAll('Macos', '');

      throw TypeMismatchException(expectedTypeName, instanceTypeName);
    }

    return _object as T;
  }
}

final class WindowsAllProperties extends AllProperties {
  const WindowsAllProperties(super.object);

  @override
  FlatButtonWindowsProperty get flatButtonProperty =>
      _property<FlatButtonWindowsProperty>();

  @override
  IconButtonWindowsProperty get iconButtonProperty =>
      _property<IconButtonWindowsProperty>();

  @override
  NavigationViewWindowsProperty get navigationViewProperty =>
      _property<NavigationViewWindowsProperty>();

  @override
  PulldownMenuWindowsProperty get pulldownMenuProperty =>
      _property<PulldownMenuWindowsProperty>();

  @override
  TabViewWindowsProperty get tabViewProperty =>
      _property<TabViewWindowsProperty>();


  @override
  DialogWindowsProperty get dialogProperty =>
      _property<DialogWindowsProperty>();
}

final class MacosAllProperties extends AllProperties {
  const MacosAllProperties(super.object);

  @override
  FlatButtonMacosProperty get flatButtonProperty =>
      _property<FlatButtonMacosProperty>();

  @override
  IconButtonMacosProperty get iconButtonProperty =>
      _property<IconButtonMacosProperty>();

  @override
  NavigationViewMacosProperty get navigationViewProperty =>
      _property<NavigationViewMacosProperty>();

  @override
  PulldownMenuMacosProperty get pulldownMenuProperty =>
      _property<PulldownMenuMacosProperty>();

  @override
  TabViewMacosProperty get tabViewProperty => _property<TabViewMacosProperty>();

  @override
  DialogMacosProperty get dialogProperty => _property<DialogMacosProperty>();
}

extension PropertyWindowsEx on CoreWindowsProperty? {
  WindowsAllProperties get all {
    if (this == null) throw const PropertyException('windows');
    return WindowsAllProperties(this);
  }
}

extension PropertyMacosEx on CoreMacosProperty? {
  MacosAllProperties get all {
    if (this == null) throw const PropertyException('macos');
    return MacosAllProperties(this);
  }
}
