import 'package:flutter/cupertino.dart';
import 'package:livescore_app/ui/views/screens/leagueScreen.dart';
import 'package:livescore_app/ui/views/screens/livescreen.dart';
import 'package:livescore_app/ui/views/screens/newsScreen.dart';
import 'package:livescore_app/ui/views/screens/profileScreen.dart';

List<Widget> screen = const [
  AllLeagues(),
  LiveScreen(),
  NewsScreen(),
  ProfileScreen()
];
