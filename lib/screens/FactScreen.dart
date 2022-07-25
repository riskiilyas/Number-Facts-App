import 'package:flutter/material.dart';
import 'package:number_facts/screens/FactTypes.dart';

class FactScreen extends StatelessWidget {
  FactScreen({Key? key, required this.type}): super(key: key);
  final FactTypes type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000330),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
