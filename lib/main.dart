import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/misc/router/router.dart';
import 'package:toko_sona/misc/utils/app_bloc_observer.dart';
import 'package:toko_sona/misc/utils/palette.dart';

void main() async {
  runZoned(() {
    setUpServices();
    Bloc.observer = AppBlocObserver();
    runApp(const TokoSonaApp());
  });
}

class TokoSonaApp extends StatelessWidget {
  const TokoSonaApp({super.key});
  @override
  Widget build(BuildContext context) {
    final GoRouter router;
    router = app<MainRouter>().router;
    return MaterialApp.router(
      title: 'Toko Sona',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Palette.primaryColor,
        ),
      ),
    );
  }
}
