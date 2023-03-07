import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/src/core/mixins/device_orientation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'src/common/providers/theme_provider.dart';
import 'src/common/widgets/builder_widget.dart';
import 'src/core/exports/constants_exports.dart';
import 'src/core/services/navigation/navigation_route.dart';

void main() {
  GetStorage.init();
  DeviceOrientationSettings.screenHorizontal();
  runApp(
    MultiProvider(
      providers: AppConstants.defaultProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeConstants.lightTheme,
      darkTheme: ThemeConstants.lightTheme,
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().themeMode,
      initialRoute: NavigationConstants.home,
      builder: (context, child) => BuilderWidget(child: child),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
