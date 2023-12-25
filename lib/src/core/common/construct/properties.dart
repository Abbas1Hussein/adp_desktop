import '../adaptive.dart';

typedef LogicCallback<T> = T Function();

abstract class CoreProperties<W, M> {
  CoreProperties({this.windows, this.macos});

  W? windows;
  M? macos;
}

final class Properties<W, M> extends CoreProperties<W, M> {
  Properties({super.windows, super.macos});

  Properties.windows(W windows) : super(windows: windows);

  Properties.macos(M macos) : super(macos: macos);

}

final class PropertiesLogic<W, M> extends CoreProperties<W, M> {
  factory PropertiesLogic({
    LogicCallback<W>? windows,
    LogicCallback<M>? macos,
  }) {
    return PropertiesLogic._internal(windows: windows, macos: macos);
  }

  factory PropertiesLogic.windows(LogicCallback<W>? windows) {
    return PropertiesLogic._internal(windows: windows);
  }

  factory PropertiesLogic.macos(LogicCallback<M>? macos) {
    return PropertiesLogic._internal(macos: macos);
  }

  PropertiesLogic._internal({
    LogicCallback<W>? windows,
    LogicCallback<M>? macos,
  }) {
    adaptiveValue<void>(
      windows: () {
        if (windows != null) this.windows = windows();
      },
      macos: () {
        if (macos != null) this.macos = macos();
      },
    );
  }
}

abstract class CoreWindowsProperty {
  const CoreWindowsProperty();
}

abstract class CoreMacosProperty {
  const CoreMacosProperty();
}

mixin NoneProperty implements CoreWindowsProperty, CoreMacosProperty {}
