import '../../components/components.dart';

abstract final class AllProperties {
  const AllProperties(this._object);

  final Object? _object;

  get filledButtonProperty;

  get flatButtonProperty;

  get iconButtonProperty;

  get pulldownMenuProperty;

  get textButtonProperty;

  get navigationViewProperty;

  get tabViewProperty;

  T? _property<T>() => _object as T?;
}

final class  _WindowsAllProperties extends AllProperties {
  const _WindowsAllProperties(super.object);

  @override
  FilledButtonWindowsProperty? get filledButtonProperty => _property();

  @override
  FlatButtonWindowsProperty get flatButtonProperty => _property();

  @override
  IconButtonWindowsProperty get iconButtonProperty => _property();

  @override
  NVWindowsProperty get navigationViewProperty => _property();

  @override
  PulldownMenuWindowsProperty get pulldownMenuProperty => _property();

  @override
  TabViewWindowsProperty get tabViewProperty => _property();

  @override
  TextButtonWindowsProperty get textButtonProperty => _property();
}

final class _MacosAllProperties extends AllProperties {
  const _MacosAllProperties(super.object);

  @override
  FilledButtonMacosProperty get filledButtonProperty => _property();

  @override
  FlatButtonMacosProperty get flatButtonProperty => _property();

  @override
  IconButtonMacosProperty get iconButtonProperty => _property();

  @override
  NVMacosProperty get navigationViewProperty => _property();

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
