import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      content: const Text(
        "Loading..",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.grey.withOpacity(0.05),
      title: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
