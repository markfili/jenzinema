import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import 'app/config.dart';
import 'app/inject_dependencies.dart' as app;
import 'common/models/genre.dart';
import 'common/models/movie.dart';
import 'source/local/models/page.dart' as page;
import 'ui/common/helpers/themes.dart';
import 'ui/screens/movies/movies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initLoggy();
  await _initHive();
  app.injectDependencies();

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

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(GenreAdapter());
  Hive.registerAdapter(page.PageAdapter());
  await Hive.openBox<Movie>(Config.dbFavorites);
  await Hive.openBox<page.Page>(Config.dbPages);
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
