import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MovieVerse()));
  // runApp(const MovieVerse());
}

class MovieVerse extends StatelessWidget {
  const MovieVerse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
