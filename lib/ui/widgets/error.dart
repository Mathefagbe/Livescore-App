import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/leagues.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/core/models/all_leagues.dart';
import 'package:provider/provider.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(2),
      contentPadding: const EdgeInsets.all(2),
      title: const Text("Something went wrong"),
      elevation: 0,
      backgroundColor: Colors.grey.withOpacity(0.03),
      actions: [
        TextButton(
            onPressed: () {
              Provider.of<Leagus>(context, listen: false).fetchLeagues(date);
            },
            child: const Text("Try again"))
      ],
      content: const Text(
        "Requested data couldn't be loaded",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
