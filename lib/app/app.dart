import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data.dart';
import '../presentation/bloc/game_bloc.dart';
import '../presentation/pages/game_page.dart';
import 'colors.dart';

/// App widget that wraps the flutter app.
class PlingoApp extends StatelessWidget {
  /// Constructor
  const PlingoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.shade1,
        brightness: Brightness.dark,
        fontFamily: 'Ubuntu',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
          color: Colors.transparent,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(64, 48),
            textStyle: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(64, 48),
            side: const BorderSide(width: 1, color: AppColors.primary),
            textStyle: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(64, 48),
            textStyle: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: BlocProvider(
        create: (ctx) =>
        GameBloc(ctx.read<GameStatsRepository>())..add(GameStarted()),
        child: const GamePage(),
      ),
    );
  }
}
