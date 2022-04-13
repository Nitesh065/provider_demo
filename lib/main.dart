import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/modal/theme_provider.dart';
import 'package:provider_demo/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
                title: "Flutter Provider Demo",
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    appBarTheme: AppBarTheme(
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarBrightness: Brightness.dark))),
            home: HomePage(),
              )),
    );
  }
}
