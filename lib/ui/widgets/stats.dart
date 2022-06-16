import 'package:flutter/material.dart';

import '../../core/models/livescorebykey.dart';

class Stats extends StatelessWidget {
  const Stats({required this.results});
  final Result results;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(results.statistics[index].home),
                  Text(results.statistics[index].type),
                  Text(results.statistics[index].away),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 10,
                      width: 150,
                      child: LinearProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.grey,
                        value: results.statistics[index].home.split("").last ==
                                "%"
                            ? double.parse(results.statistics[index].home
                                    .replaceAll(RegExp(r"%"), "")) *
                                0.01
                            : results.statistics[index].home.length == 2
                                ? double.parse(results.statistics[index].home) *
                                    0.01
                                : double.parse(results.statistics[index].home) *
                                    0.001,
                      )),
                  SizedBox(
                      height: 10,
                      width: 150,
                      child: LinearProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.grey,
                        value: results.statistics[index].away.split("").last ==
                                "%"
                            ? double.parse(results.statistics[index].away
                                    .replaceAll(RegExp(r"%"), "")) *
                                0.01
                            : results.statistics[index].away.length == 2
                                ? double.parse(results.statistics[index].away) *
                                    0.01
                                : double.parse(results.statistics[index].away) *
                                    0.001,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        },
        itemCount: results.statistics.length);
  }
}
