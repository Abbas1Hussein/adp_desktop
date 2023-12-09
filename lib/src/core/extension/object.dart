import 'package:adp_desktop/adp_desktop.dart';

abstract class AllProperties {
  const AllProperties(this._object);

  get filledButtonProperty;

  get flatButtonProperty;

  get iconButtonProperty;

  get pulldownMenuProperty;

  get textButtonProperty;

  get navigationViewProperty;

  get tabViewProperty;

  final Object? _object;

  T? _property<T>() => _object as T?;
}

class _WindowsAllProperties extends AllProperties {
  const _WindowsAllProperties(super.object);

  @override
  FilledButtonWindowsProperty? get filledButtonProperty => _property();

  @override
  FlatButtonWindowsProperty get flatButtonProperty => _property();

  @override
  IconButtonWindowsProperty get iconButtonProperty => _property();

  @override
  NViewWindowsProperty get navigationViewProperty => _property();

  @override
  PulldownMenuWindowsProperty get pulldownMenuProperty => _property();

  @override
  TabViewWindowsProperty get tabViewProperty => _property();

  @override
  TextButtonWindowsProperty get textButtonProperty => _property();
}

class _MacosAllProperties extends AllProperties {
  const _MacosAllProperties(super.object);

  @override
  FilledButtonMacosProperty get filledButtonProperty => _property();

  @override
  FlatButtonMacosProperty get flatButtonProperty => _property();

  @override
  IconButtonMacosProperty get iconButtonProperty => _property();

  @override
  NViewMacosProperty get navigationViewProperty => _property();

  @override
  PulldownMenuMacosProperty get pulldownMenuProperty => _property();

  @override
  TabViewMacosProperty get tabViewProperty => _property();

  @override
  TextButtonMacosProperty get textButtonProperty => _property();
}

extension PropertyExAs on Object? {
  _MacosAllProperties get macosProperties => _MacosAllProperties(this);

  _WindowsAllProperties get windowsProperties => _WindowsAllProperties(this);
}
