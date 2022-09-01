// import 'package:finance/router/custom_router.dart';
import 'package:finance/screen/register.dart';
import 'package:finance/setting/language.dart';
import 'package:finance/setting/setting.dart';
import 'package:finance/tabbarPage/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screen/get_start.dart';
import 'homepage.dart';
import 'screen/login.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
      debugShowCheckedModeBanner: false,
      title: 'Finance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}
