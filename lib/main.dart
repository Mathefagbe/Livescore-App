import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/datechanger.dart';
import 'package:livescore_app/core/View_models/homeviewmodel.dart';
import 'package:livescore_app/core/View_models/leagues.dart';
import 'package:livescore_app/core/View_models/livescore_modelview.dart';
import 'package:livescore_app/core/View_models/theme_model.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/ui/widgets/themeswitch.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeviewModel()),
        ChangeNotifierProvider(create: (context) => DateChangerview()),
        ChangeNotifierProvider(create: (context) => Leagus(date)),
        ChangeNotifierProvider(create: (context) => ThemeChanger()),
        ChangeNotifierProvider(create: (context) => LiveMatch()),
        ChangeNotifierProvider(create: (context) => ThemeChanger()),
      ],
      child: const ThemeSwitch(),
    );
  }
}
