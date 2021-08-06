import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'factory/factory.dart';

class ZeitplanApp extends StatelessWidget {
  const ZeitplanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Zeitplan",
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => makeContactPage()),
      ],
    );
  }
}
