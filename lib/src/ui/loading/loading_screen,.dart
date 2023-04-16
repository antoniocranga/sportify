import 'package:flutter/material.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';

class LoadingScreen extends StatelessWidget {
  final Widget? widget;
  const LoadingScreen({Key? key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.0.cw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            if (widget != null) widget!
          ],
        ),
      ),
    );
  }
}