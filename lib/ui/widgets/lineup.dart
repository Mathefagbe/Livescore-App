import 'package:flutter/material.dart';

import 'package:livescore_app/core/models/livescorebykey.dart';

class Lineup extends StatelessWidget {
  const Lineup({required this.result});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 5,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Text("Starting Lineups",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ))),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 5,
        ),
        Table(
          columnWidths: const {
            0: FixedColumnWidth(30),
            3: FixedColumnWidth(30)
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
              result.lineups.awayTeam.startingLineups.length,
              (index) => TableRow(children: [
                    Text(
                      result
                          .lineups.homeTeam.startingLineups[index].playerNumber,
                      style: const TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      result.lineups.homeTeam.startingLineups[index].player,
                      style: const TextStyle(
                        fontSize: 17,
                        // fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      result.lineups.awayTeam.startingLineups[index].player,
                      style: const TextStyle(
                        fontSize: 17,
                        //fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                    ),
                    Text(
                      result
                          .lineups.homeTeam.startingLineups[index].playerNumber,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ])),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 3,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Text("Substitution",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ))),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        Table(
          columnWidths: const {
            0: FixedColumnWidth(30),
            3: FixedColumnWidth(30)
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
              result.lineups.homeTeam.substitutes.length <
                      result.lineups.awayTeam.substitutes.length
                  ? result.lineups.homeTeam.substitutes.length
                  : result.lineups.awayTeam.substitutes.length,
              (index) => TableRow(children: [
                    Text(
                      result.lineups.homeTeam.substitutes[index].playerNumber,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      result.lineups.homeTeam.substitutes[index].player,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      result.lineups.awayTeam.substitutes[index].player,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                    ),
                    Text(
                      result.lineups.homeTeam.substitutes[index].playerNumber,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ])),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
