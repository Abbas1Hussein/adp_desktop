import 'platforms.dart';

typedef LogicCallBack<T> = T Function();

abstract class CoreProperties<W, M> extends CorePlatforms<W, M> {
  const CoreProperties({
    final W? windows,
    final M? macos,
  }) : super(windows: windows, macos: macos);
}

final class Properties<W, M> extends CoreProperties<W, M> {
  const Properties({super.windows, super.macos});
}

final class PropertiesLogic<W, M> extends CoreProperties<W, M> {
  PropertiesLogic({
    LogicCallBack<W>? windows,
    LogicCallBack<M>? macos,
  }) : super(windows: windows?.call(), macos: macos?.call());
}

final class OnlyProperty<W, M> extends CoreProperties<W, M> {
  const OnlyProperty.windows(W? windows) : super(windows: windows);

  const OnlyProperty.macos(M? macos) : super(macos: macos);
}

final class OnlyPropertyLogic<W, M> extends CoreProperties<W, M> {
  OnlyPropertyLogic.windows(LogicCallBack<W>? windows)
      : super(windows: windows?.call());

  OnlyPropertyLogic.macos(LogicCallBack<M>? macos)
      : super(macos: macos?.call());
}

abstract class CoreWindowsProperty {
  const CoreWindowsProperty();
}

abstract class CoreMacosProperty {
  const CoreMacosProperty();
}

mixin class NoneProperty implements CoreWindowsProperty, CoreMacosProperty {}
