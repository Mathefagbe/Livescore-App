import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/leaguematches.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/ui/widgets/lodaingindicator.dart';
import 'package:provider/provider.dart';

class FixtureScreen extends StatelessWidget {
  final String leaguekey;
  final String leagueName;
  final String countryName;
  final String countrylogo;
  final String leaguelogo;
  const FixtureScreen(
      {required this.leaguekey,
      required this.leagueName,
      required this.countryName,
      required this.countrylogo,
      required this.leaguelogo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Matches(date, leaguekey),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Row(children: const [
              Icon(Icons.sports_soccer),
              SizedBox(
                width: 5,
              ),
              Text("Football")
            ]),
          ),
          body: Consumer<Matches>(builder: (context, value, child) {
            if (value.home == Homelog.loading) {
              return const LoadingIndicator();
            } else if (value.home == Homelog.error) {
              return const Center(
                child: Text("NO MATCH FOR THIS DATE"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      leading: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(leaguelogo == ""
                                    ? countrylogo
                                    : leaguelogo))),
                      ),
                      title: Column(
                        children: [
                          Text(
                            leagueName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            countryName,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(8),
                              height: 80,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                          value.fix!.result[index].homeTeamLogo,
                                          height: 18,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, child, stackTrace) =>
                                                  const Icon(Icons.error)),
                                      Image.network(
                                          value.fix!.result[index].awayTeamLogo,
                                          height: 18,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, child, stackTrace) =>
                                                  const Icon(Icons.error)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          value
                                              .fix!.result[index].eventHomeTeam,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                      Text(
                                          value
                                              .fix!.result[index].eventAwayTeam,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  const Spacer(),
                                  value.fix!.result[index].eventFtResult == ""
                                      ? Align(
                                          child: Text(value
                                              .fix!.result[index].eventTime),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                value.fix!.result[index]
                                                    .eventFtResult
                                                    .split(" - ")
                                                    .first,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                value.fix!.result[index]
                                                    .eventFtResult
                                                    .split(" - ")
                                                    .last,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                            height: 2,
                          )
                        ],
                      );
                    }, childCount: value.fix!.result.length))
                  ],
                ),
              );
            }
          }),
        ));
  }
}
