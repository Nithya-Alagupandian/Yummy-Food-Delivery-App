import 'package:device_info/device_info.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:yummy_food_delivery/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //intialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase Analytics and log custom event with device information
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // Set device details
  setDeviceDetails(analytics);

  // Initialize Crashlytics
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("************Nithya************");
    FirebaseMessaging _firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((token) {
      print("MyApp......token is : $token");
    });
    /* SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white
            //color set to purple or set your own color
            )); */
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /* navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ], */
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void setDeviceDetails(FirebaseAnalytics analytics) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  // Set device brand and model as user properties
  analytics.setUserProperty(name: 'device_brand', value: androidInfo.brand);
  analytics.setUserProperty(name: 'device_model', value: androidInfo.model);
  analytics.setUserProperty(name: 'device_host', value: androidInfo.host);
  analytics.setUserProperty(name: 'device_id', value: androidInfo.id);
  analytics.setUserProperty(
      name: 'device_manufacturer', value: androidInfo.manufacturer);
  analytics.setUserProperty(
      name: 'device_androidId', value: androidInfo.androidId);

  print('device_brand        : ${androidInfo.brand}');
  print('device_model        : ${androidInfo.model}');
  print('device_host         : ${androidInfo.host}');
  print('device_id           : ${androidInfo.id}');
  print('device_manufacturer : ${androidInfo.manufacturer}');
  print('device_androidId    : ${androidInfo.androidId}');
}
