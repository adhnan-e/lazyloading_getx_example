import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '/screen/main_screen.dart';

import 'bindings/main_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LazyLoading Getx Example',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: "/mainScreen",
      getPages: [
        GetPage(
            name: '/mainScreen',
            page: () => MainScreen(),
            binding: MainBindings()),
      ],
    );
  }
}
