import 'package:badge/badge.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Badge(text: "Flutter"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
