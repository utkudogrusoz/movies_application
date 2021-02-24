import 'package:flutter/material.dart';
import 'package:movies_application/core/constants/ui/color_constants.dart';
import 'package:movies_application/ui/views/movies_page/home_view.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: ColorConstants.instance.indianKhaki),
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: HomeView()
    );
  }
}