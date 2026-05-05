import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:slt/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:slt/screens/onboarding_page.dart';
import 'package:slt/providers/complaint_provider.dart';
import 'package:slt/providers/auth_provider.dart';
import 'package:slt/utils/responsive.dart';
import 'providers/language_provider.dart';
import 'providers/cases_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => ComplaintProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => CasesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SLT App',
          theme: ThemeData(primarySwatch: Colors.blue),
          
          locale: languageProvider.currentLocale, 
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), 
            Locale('si'), 
            Locale('ta'), 
          ],
          home: const OnboardingPage(),
        );
      },
    );
  }
}
