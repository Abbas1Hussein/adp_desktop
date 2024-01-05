import '../adaptive.dart';

export 'property.dart';

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
    PropertiesCallback<W>? windows,
    PropertiesCallback<M>? macos,
  }) {
    return PropertiesLogic._internal(windows: windows, macos: macos);
  }

  factory PropertiesLogic.windows(PropertiesCallback<W>? windows) {
    return PropertiesLogic._internal(windows: windows);
  }

  factory PropertiesLogic.macos(PropertiesCallback<M>? macos) {
    return PropertiesLogic._internal(macos: macos);
  }

  PropertiesLogic._internal({
    PropertiesCallback<W>? windows,
    PropertiesCallback<M>? macos,
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

typedef PropertiesCallback<T> = T Function();
