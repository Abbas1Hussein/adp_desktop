import 'package:flutter/widgets.dart';

/// An abstract base class for defining a model that can be adapted for both Windows and macOS platforms.
///
/// - [W]: Type of data when adapted for the Windows platform.
/// - [M]: Type of data when adapted for the macOS platform.
abstract class CoreModel<W, M> {
  /// Creates an instance of [CoreModel].
  const CoreModel();

  /// Converts the model to its representation on the Windows platform.
  ///
  /// Returns an instance of [W] representing the model on the Windows platform.
  W toWindows(BuildContext context);

  /// Converts the model to its representation on the macOS platform.
  ///
  /// Returns an instance of [M] representing the model on the macOS platform.
  M toMacos(BuildContext context);
}
