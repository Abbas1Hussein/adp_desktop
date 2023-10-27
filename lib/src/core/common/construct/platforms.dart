import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../enum/target.dart';

abstract class CorePlatforms<WINDOWS, MACOS> {
  final WINDOWS? windows;
  final MACOS? macos;

  const CorePlatforms({this.windows, this.macos});
}

class DefaultPlatforms {
  final bool _isDebugging;
  final AdaptiveTargetPlatform _platform;
  final AdaptiveTargetPlatform? _targetLinux;
  final AdaptiveTargetPlatform? _targetWeb;

  DefaultPlatforms._(
    this._platform, {
    AdaptiveTargetPlatform? targetLinux,
    AdaptiveTargetPlatform? targetWeb,
    bool isDebugging = false,
  })  : _targetLinux = targetLinux,
        _targetWeb = targetWeb,
        _isDebugging = isDebugging;

  static DefaultPlatforms? _instance;

  factory DefaultPlatforms.initialize(
    AdaptiveTargetPlatform platform, {
    AdaptiveTargetPlatform? targetLinux,
    AdaptiveTargetPlatform? targetWeb,
    bool isDebugging = false,
  }) {
    return _instance ??= DefaultPlatforms._(
      platform,
      targetLinux: targetLinux,
      targetWeb: targetWeb,
      isDebugging: isDebugging,
    );
  }

  TargetPlatform get platform {
    return defaultAdaptiveTargetPlatform(_platform);
  }

  AdaptiveTargetPlatform get adaptiveTargetPlatform => _platform;

  AdaptiveTargetPlatform? get targetLinux =>
      _targetLinux ?? AdaptiveTargetPlatform.windows;

  AdaptiveTargetPlatform? get targetWeb =>
      _targetWeb ?? AdaptiveTargetPlatform.windows;

  bool get isDebugging => _isDebugging;

  static DefaultPlatforms? get instance => _instance;
}
