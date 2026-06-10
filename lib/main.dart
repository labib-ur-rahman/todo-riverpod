import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() {
  /// -- The [ProviderScope] widget is required to use Riverpod. It should wrap the entire application.
  runApp(const ProviderScope(child: App()));
}
