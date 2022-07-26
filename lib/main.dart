import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:number_facts/blocs/FactBloc.dart';
import 'package:number_facts/screens/HomeScreen.dart';

void main() {
  runApp(GetMaterialApp(
    home: MaterialApp(
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => FactBloc())
        ],
          child: const HomeScreen()
      ),
    ),
  ));
}