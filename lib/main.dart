import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/app_info.dart';
import 'api/constant.dart';
import 'boilerplate.dart';
import 'service/initial_configuration.dart';
import 'theme/theme.dart';
import 'view/splash/_pr/pr_splash.dart';

void main() async {
  await initialConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ProviderSplash())],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          title: MyAppInfo.appName,
          home: const Boilerplate(),
        ));
  }
}
