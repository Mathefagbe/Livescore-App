import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/datechanger.dart';
import 'package:livescore_app/core/View_models/leagues.dart';
import 'package:livescore_app/core/View_models/theme_model.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/core/database/localdatabase.dart';
import 'package:livescore_app/ui/views/screens/all_gamesScreen.dart';
import 'package:livescore_app/ui/views/screens/leaguematchScreen.dart';
import 'package:livescore_app/ui/widgets/error.dart';
import 'package:livescore_app/ui/widgets/lodaingindicator.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class AllLeagues extends StatefulWidget {
  const AllLeagues({Key? key}) : super(key: key);

  @override
  State<AllLeagues> createState() => _AllLeaguesState();
}

class _AllLeaguesState extends State<AllLeagues> {
  @override
  void initState() {
    Provider.of<ThemeChanger>(context, listen: false).loadtheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dateChange = Provider.of<DateChangerview>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<Leagus>(builder: (context, value, child) {
        if (value.home == Homelog.loading) {
          return const LoadingIndicator();
        } else if (value.home == Homelog.error) {
          return const Error();
        } else {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 70,
                width: double.maxFinite,
                child: TableCalendar(
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(fontSize: 15),
                    weekdayStyle: TextStyle(fontSize: 15),
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  headerVisible: false,
                  calendarStyle: const CalendarStyle(
                      selectedTextStyle:
                          TextStyle(color: Colors.red, fontSize: 15),
                      weekendTextStyle: TextStyle(fontSize: 15),
                      defaultTextStyle: TextStyle(fontSize: 15),
                      todayDecoration: BoxDecoration(),
                      todayTextStyle:
                          TextStyle(color: Colors.red, fontSize: 15)),
                  calendarFormat: CalendarFormat.week,
                  availableCalendarFormats: const {CalendarFormat.week: "week"},
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2025),
                  focusedDay: dateChange.focusdays,
                  currentDay: dateChange.currentDay,
                  onDaySelected: (selectedDay, focusDay) {
                    date = selectedDay.toString().split(" ").first;
                    Provider.of<Leagus>(context, listen: false)
                        .fetchLeagues(date);
                    Provider.of<DateChangerview>(context, listen: false)
                        .dateChanger(selectedDay, focusDay);
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllGames()));
                },
                child: SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: Row(children: const [
                      Icon(Icons.list),
                      Text(
                        "All games",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ])),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      floating: true,
                      // pinned: true,
                      title: Text(
                        "All competition[A-z]",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      var resultId = value.leagus!.result[index].leagueKey;
                      var leagueName = value.leagus!.result[index].leagueName;
                      var countryName = value.leagus!.result[index].countryName;
                      var countrylogo = value.leagus!.result[index].countryLogo;
                      var leaguelogo = value.leagus!.result[index].leagueLogo;

                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 5.0, right: 5, top: 10),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FixtureScreen(
                                              leaguekey: resultId,
                                              leagueName: leagueName,
                                              countryName: countryName,
                                              countrylogo: countrylogo,
                                              leaguelogo: leaguelogo,
                                            )));
                              },
                              child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(value
                                                            .leagus!
                                                            .result[index]
                                                            .countryLogo ==
                                                        ""
                                                    ? value
                                                        .leagus!
                                                        .result[index]
                                                        .leagueLogo
                                                    : value
                                                        .leagus!
                                                        .result[index]
                                                        .countryLogo))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(value.leagus!.result[index]
                                                .countryName),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              value.leagus!.result[index]
                                                  .leagueName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                              height: 2,
                            )
                          ],
                        ),
                      );
                    }, childCount: 100))
                  ],
                ),
              )
            ]),
          );
        }
      }),
    );
  }
}
