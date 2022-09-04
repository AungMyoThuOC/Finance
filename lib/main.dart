// import 'package:finance/router/custom_router.dart';
import 'dart:async';
// import 'dart:math';

import 'package:finance/presentationColr/providers/theme_provider.dart';
import 'package:finance/presentationColr/styles/app_themes.dart';
import 'package:finance/screen/register.dart';
import 'package:finance/servicesCol/service_locator.dart';
import 'package:finance/servicesCol/storage/storage_service.dart';
import 'package:finance/setting/colors.dart';
import 'package:finance/setting/language.dart';
import 'package:finance/setting/setting.dart';
import 'package:finance/tabbarPage/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screen/get_start.dart';
import 'homepage.dart';
import 'screen/login.dart';
import 'setting/security.dart';
import 'tabbarPage/income.dart';
import 'tabbarPage/outcome.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runZonedGuarded<Future<void>>(() async {
    setUpServiceLocator();

    final StorageService storageService = getIt<StorageService>();
    await storageService.init();

    runApp(MyApp(
      storageService: storageService,
    ));
  }, (e, _) => throw e);
}

class MyApp extends StatelessWidget {
  final StorageService storageService;
  const MyApp({
    Key? key,
    required this.storageService,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(storageService),
          )
        ],
        child: Consumer<ThemeProvider>(
          builder: (c, themeProvider, home) => MaterialApp(
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            // onGenerateInitialRoutes: CustomRouter.generatedRoute,
            initialRoute: '/',
            routes: {
              '/': (context) => const GetStartPage(),
              '/register': (context) => const RegisterPage(),
              // '/verify': (context) => const VerifyScreen(),
              '/login': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
              '/tabbar': (context) => const TabBarPage(),
              '/income': (context) => const IncomePage(),
              '/outcome': (context) => const OutcomePage(),
              '/setting': (context) => const SettingPage(),
              '/language': (context) => const LanguagePage(),
              '/security': (context) => const SecurityPage(),
              '/color': (context) => const ColorPage(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Finance',
           theme: AppThemes.main(
            primaryColor: themeProvider.selectedPrimaryColor
           ),
           darkTheme: AppThemes.main(
            isDark: true,
            primaryColor: themeProvider.selectedPrimaryColor
           ),
           themeMode: themeProvider.selectedThemeMode,
            builder: EasyLoading.init(),
          ),
        ));
  }
}
