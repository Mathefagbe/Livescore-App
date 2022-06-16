import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/livescore_modelview.dart';
import 'package:livescore_app/ui/views/screens/livematchdetail.dart';
import 'package:livescore_app/ui/widgets/lodaingindicator.dart';
import 'package:provider/provider.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<LiveMatch>(context).liveScore;
    var refreshscore = Provider.of<LiveMatch>(context).getlivescore();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RefreshIndicator(
        onRefresh: () => refreshscore,
        child: value == null
            ? const LoadingIndicator()
            : Column(
                children: [
                  SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: Row(
                        children: const [
                          Icon(Icons.live_tv),
                          Text(
                            "Live Matches",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          var eventkey = value.result[index].eventKey;

                          return Column(
                            children: [
                              SizedBox(
                                height: 50,
                                width: double.maxFinite,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  slivers: [
                                    SliverAppBar(
                                      leading: const Icon(null),
                                      leadingWidth: 0,
                                      floating: true,
                                      elevation: 10,
                                      title: Row(
                                        children: [
                                          //container for leaguelog
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(value
                                                                .result[index]
                                                                .leagueLogo ==
                                                            ""
                                                        ? value.result[index]
                                                            .countryLogo
                                                        : value.result[index]
                                                            .leagueLogo))),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          //column for leaguename and countryname
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value
                                                      .result[index].leagueName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  value.result[index]
                                                      .countryName,
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //container for homelogos,scores and status
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LiveMatchDetails(
                                                eventkey: eventkey,
                                              )));
                                },
                                child: Container(
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
                                                value.result[index]
                                                            .homeTeamLogo ==
                                                        ""
                                                    ? value.result[index]
                                                        .countryLogo
                                                    : value.result[index]
                                                        .homeTeamLogo,
                                                height: 18,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, child,
                                                        stackTrace) =>
                                                    const Icon(Icons.error)),
                                            Image.network(
                                                value
                                                    .result[index].awayTeamLogo,
                                                height: 18,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, child,
                                                        stackTrace) =>
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
                                                value.result[index]
                                                    .eventHomeTeam,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            Text(
                                                value.result[index]
                                                    .eventAwayTeam,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                        const Spacer(),
                                        value.result[index].eventStatus == ""
                                            ? Align(
                                                child: Text(value
                                                    .result[index].eventTime),
                                              )
                                            : Align(
                                                child: Text(
                                                  value.result[index]
                                                      .eventStatus,
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                value.result[index]
                                                    .eventFinalResult
                                                    .split(" - ")
                                                    .first,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                            Text(
                                                value.result[index]
                                                    .eventFinalResult
                                                    .split(" - ")
                                                    .last,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red))
                                          ],
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              Divider(
                                color: Colors.grey.withOpacity(0.5),
                                height: 5,
                                thickness: 0.9,
                              )
                            ],
                          );
                        }, childCount: value.result.length))
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
