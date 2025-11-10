import 'package:flutter/material.dart';
import 'package:smart_saloon/sign_in_page.dart';
import 'package:smart_saloon/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Salon",
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromRGBO(254, 206, 1, 1), 
          ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            //fontFamily: 'KaushanScript',
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 35,
               fontWeight: FontWeight.bold
               ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
          ),
          useMaterial3: true,
      ),
      home: SignInPage(),
    );
  }
}
