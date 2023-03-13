import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/screens.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

void main() async {
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('i4vhDDGchTLiiaBna45t8mN1aw37eISZfxi8YXKS',
      'https://parseapi.back4app.com/',
      clientKey: 'WrE1AFJGOh8DbZUqNAJmDQR7jF9bShxdRoSy2Ga5',
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OLX',
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: BaseScreen(),
    );
  }
}
