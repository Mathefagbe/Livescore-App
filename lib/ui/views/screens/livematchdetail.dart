import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/livescoreBymatchKey.dart';
import 'package:livescore_app/core/View_models/livescore_modelview.dart';
import 'package:livescore_app/core/View_models/theme_model.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/core/models/livescore.dart';
import 'package:livescore_app/ui/widgets/error.dart';
import 'package:livescore_app/ui/widgets/lineup.dart';
import 'package:livescore_app/ui/widgets/lodaingindicator.dart';
import 'package:livescore_app/ui/widgets/stats.dart';
import 'package:provider/provider.dart';

class LiveMatchDetails extends StatefulWidget {
  const LiveMatchDetails({required this.eventkey});

  final String eventkey;

  @override
  State<LiveMatchDetails> createState() => _LiveMatchDetailsState();
}

class _LiveMatchDetailsState extends State<LiveMatchDetails> {
  @override
  Widget build(BuildContext context) {
    var toggle = Provider.of<ThemeChanger>(context).theme;
    return ChangeNotifierProvider<LiveScoreid>(
      create: (context) => LiveScoreid(widget.eventkey),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: const [
                Icon(Icons.sports_soccer),
                SizedBox(
                  width: 10,
                ),
                Text("Football"),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Consumer<LiveScoreid>(builder: (context, value, child) {
            if (value.home == Homelog.loading) {
              return const LoadingIndicator();
            } else if (value.home == Homelog.error) {
              return const Error();
            } else {
              var refresh = value.getlivescoreByKey(widget.eventkey);
              return RefreshIndicator(
                onRefresh: () => refresh,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.maxFinite,
                      child: CustomScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            floating: true,
                            leadingWidth: 0,
                            leading: const Icon(null),
                            toolbarHeight: 150,
                            backgroundColor: toggle
                                ? Colors.white
                                : Theme.of(context).appBarTheme.backgroundColor,
                            titleTextStyle: TextStyle(
                                color: toggle ? Colors.black : Colors.white),
                            title: SizedBox(
                              width: double.maxFinite,
                              height: 150,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(value
                                                            .liveScore!
                                                            .result[0]
                                                            .leagueLogo ==
                                                        ""
                                                    ? value.liveScore!.result[0]
                                                        .countryLogo
                                                    : value.liveScore!.result[0]
                                                        .leagueLogo))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        value.liveScore!.result[0].countryName,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const Text(
                                        ":",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Flexible(
                                        child: Text(
                                          value.liveScore!.result[0].leagueName,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
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
                                                          .liveScore!
                                                          .result[0]
                                                          .homeTeamLogo)))),
                                          Text(
                                            value.liveScore!.result[0]
                                                .eventHomeTeam
                                                .replaceFirst(
                                                    RegExp(r" "), "\n", 0),
                                            style:
                                                const TextStyle(fontSize: 15),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(date,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              value.liveScore!.result[0]
                                                  .eventFinalResult,
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.red)),
                                          Text(
                                              value.liveScore!.result[0]
                                                  .eventStatus,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Column(
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
                                                          .liveScore!
                                                          .result[0]
                                                          .awayTeamLogo)))),
                                          Text(
                                            value.liveScore!.result[0]
                                                .eventAwayTeam
                                                .replaceFirst(
                                                    RegExp(r" "), "\n", 0),
                                            style:
                                                const TextStyle(fontSize: 15),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer()
                                ],
                              ),
                            ),
                            bottom: TabBar(
                                labelColor:
                                    toggle ? Colors.black : Colors.white,
                                indicatorColor: Colors.red,
                                indicatorWeight: 15,
                                tabs: const [
                                  Tab(
                                    text: "Lineup",
                                  ),
                                  Tab(
                                    text: "Stats",
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: TabBarView(children: [
                        Lineup(
                          result: value.liveScore!.result[0],
                        ),
                        Stats(
                          results: value.liveScore!.result[0],
                        ),
                      ]),
                    )
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
