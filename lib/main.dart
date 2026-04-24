import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nti_hub_app/core/router/app_router.dart';
import 'package:nti_hub_app/core/services/service_locator.dart';
import 'package:nti_hub_app/core/theme/app_theme.dart';
import 'package:nti_hub_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setup();

  runApp(const NTIHubApp());
}

class NTIHubApp extends StatelessWidget {
  const NTIHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'NTI Hub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
