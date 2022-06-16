import 'package:flutter/material.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/core/models/fixtures.dart';
import 'package:livescore_app/core/services/data_services.dart';
import 'package:livescore_app/ui/widgets/lodaingindicator.dart';
import 'package:provider/provider.dart';

class AllGames extends StatelessWidget {
  const AllGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
        create: (context) => DataServices().getALLFixture(date),
        initialData: null,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: const Text("All Games"),
          ),
          body: Consumer<Fixtures?>(
              builder: (context, value, child) => value == null
                  ? const LoadingIndicator()
                  : Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            height: 35,
                            child: Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                              child: CustomScrollView(
                            slivers: [
                              SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: double.maxFinite,
                                      child: CustomScrollView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        slivers: [
                                          SliverAppBar(
                                            leading: const Icon(null),
                                            leadingWidth: 0,
                                            // floating: true,
                                            elevation: 10,
                                            pinned: true,

                                            title: Row(
                                              children: [
                                                //container for leaguelog
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(value
                                                                      .result[
                                                                          index]
                                                                      .leagueLogo ==
                                                                  ""
                                                              ? value
                                                                  .result[index]
                                                                  .countryLogo
                                                              : value
                                                                  .result[index]
                                                                  .leagueLogo))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                //column for leaguename and countryname
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        value.result[index]
                                                            .leagueName,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        value.result[index]
                                                            .countryName,
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        height: 80,
                                        width: double.maxFinite,
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.network(
                                                    value.result[index]
                                                        .homeTeamLogo,
                                                    height: 18,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            child,
                                                            stackTrace) =>
                                                        const Icon(
                                                            Icons.error)),
                                                Image.network(
                                                    value.result[index]
                                                        .awayTeamLogo,
                                                    height: 18,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            child,
                                                            stackTrace) =>
                                                        const Icon(
                                                            Icons.error)),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                            value.result[index].eventStatus ==
                                                    EventStatus.EMPTY
                                                ? Align(
                                                    child: Text(value
                                                        .result[index]
                                                        .eventTime),
                                                  )
                                                : Align(
                                                    child: Text(
                                                      value.result[index]
                                                          .eventStatus
                                                          .toString()
                                                          .split(".")
                                                          .last,
                                                      style: const TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    value.result[index]
                                                        .eventFtResult
                                                        .split(" - ")
                                                        .first,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    value.result[index]
                                                        .eventFtResult
                                                        .split(" - ")
                                                        .last,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    Divider(
                                      color: Colors.grey.withOpacity(0.5),
                                      height: 3,
                                      thickness: 1,
                                    )
                                  ],
                                );
                              }, childCount: 20))
                            ],
                          ))
                        ],
                      ),
                    )),
        ));
  }
}
