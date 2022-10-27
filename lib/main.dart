import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:path_provider/path_provider.dart';

import 'app/inject_dependencies.dart' as app;
import 'ui/common/helpers/themes.dart';
import 'ui/screens/movies/movies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initLoggy();
  var path = (await getTemporaryDirectory()).path;
  app.injectDependencies(tmpDirPath: path);
  EquatableConfig.stringify = true;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

void _initLoggy() {
  Loggy.initLoggy(
    logPrinter: StreamPrinter(
      const PrettyDeveloperPrinter(),
    ),
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.error,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.jtheme,
      home: const MoviesScreen(),
    );
  }
}
