import 'package:provider/provider.dart';
import '../../../common/providers/connection_provider.dart';
import '../../../common/providers/theme_provider.dart';

class AppConstants {
  static const appName = 'AppName';
  static const fontFamily = 'fontFamily';

  static final defaultProviders = [
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider<ConnectionProvider>(
      create: (context) => ConnectionProvider(),
    ),
  ];
}
