import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/routes/routes_name.dart';
import 'package:note_app/routes/routes_pages.dart';
import 'package:note_app/utils/color.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context ) {
    final size =MediaQuery.sizeOf(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize:size.height*.06,
            fontWeight: FontWeight.w400
          ),
          bodyMedium:  TextStyle(
            color: Colors.black,
            fontSize:size.height*.03,
            fontWeight: FontWeight.w400
        ),
          bodySmall:  TextStyle(
              color: Colors.black,
              fontSize:size.height*.02,
              fontWeight: FontWeight.w300
          ),
        )
      ),
   getPages: RoutesPages.routes,
      initialRoute: RoutesName.home,
    );
  }
}

