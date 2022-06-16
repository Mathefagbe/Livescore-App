import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/theme_model.dart';
import 'package:livescore_app/core/database/localdatabase.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentTheme = Provider.of<ThemeChanger>(context);
    var toggle = Provider.of<ThemeChanger>(context).theme;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(toggle ? Icons.light_mode : Icons.dark_mode),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  toggle ? "Light Mode" : "Dark Mode",
                  style: const TextStyle(fontSize: 15),
                ),
                const Spacer(),
                Switch(
                    value: currentTheme.theme,
                    onChanged: (bool value) {
                      Provider.of<ThemeChanger>(context, listen: false)
                          .switchThemes(value);
                      Database.savethemes(currentTheme.theme);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
