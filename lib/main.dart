import 'package:flutter/material.dart';
import 'package:marvel_characters_app/fetaure/view/detail_view.dart';
import 'package:marvel_characters_app/fetaure/view/home_view.dart';
import 'package:marvel_characters_app/fetaure/view_model/home_view_model.dart';
import 'package:marvel_characters_app/product/constant/my_color.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(     
      
       create: (BuildContext context) => HomeViewModel(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel Characters',
        theme: ThemeData(
            scaffoldBackgroundColor: MyColors.marvelGrey,
            primarySwatch: Colors.red,
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent),
            primaryColorLight: Colors.transparent,
            backgroundColor: Colors.transparent),
        home:  HomeView(),
      ),
    );
  }
}
