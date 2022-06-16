import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/theme_model.dart';
import 'package:livescore_app/core/constant/themes.dart';
import 'package:livescore_app/ui/views/homeview.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var toggle = Provider.of<ThemeChanger>(context).theme;
    return MaterialApp(
        theme: toggle ? lighttheme : darktheme,
        debugShowCheckedModeBanner: false,
        home: const Homeview());
  }
}
