import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_facts/blocs/FactBloc.dart';
import 'package:number_facts/screens/FactScreen.dart';
import 'package:number_facts/screens/FactTypes.dart';
import 'package:get/get.dart';
import 'package:number_facts/utilities/Widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000330),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                  color: Colors.white24
                ),
                child: Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Number Facts!',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 32
                        ),
                      ),
                      Text(
                        'by KeeCoding',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(BlocProvider.value(
                                        value: BlocProvider.of<FactBloc>(context),
                                        child: const FactScreen(type: FactTypes.date))
                                    );
                                  },
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [Color(0xFFED6EA0), Color(0xFFEA8E6F)]
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(24))
                                      ),
                                      child: const ContentFact(
                                        title: 'Date',
                                        desc: 'Get Interesting Facts about all date in History!',
                                        icon: Icons.calendar_today_outlined,
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(BlocProvider.value(
                                        value: BlocProvider.of<FactBloc>(context),
                                        child: const FactScreen(type: FactTypes.year,))
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Color(0xFF566EE9), Color(0xFF06BCFC)]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(24))
                                    ),
                                    child: const ContentFact(
                                      title: 'Year',
                                      desc: 'Get Fun Facts of all Years!',
                                      icon: Icons.history_toggle_off_sharp,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(BlocProvider.value(
                                        value: BlocProvider.of<FactBloc>(context),
                                        child: const FactScreen(type: FactTypes.math,))
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Color(0xFFA08BCD), Color(0xFFF7C3EA)]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(24))
                                    ),
                                    child: const ContentFact(
                                      title: 'Math',
                                      desc: 'Get Fun Fact about Numbers in Math!',
                                      icon: Icons.menu_book,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FactScreen(type: FactTypes.trivia)),
                                    // );
                                    Get.to(BlocProvider.value(
                                        value: BlocProvider.of<FactBloc>(context),
                                        child: const FactScreen(type: FactTypes.trivia))
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Color(0xFFD02B4A), Color(0xFFF15880)]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(24)),
                                    ),
                                    child: const ContentFact(
                                      title: "Trivia",
                                      desc: "Get Interesting General Facts of a Number!",
                                      icon: Icons.wine_bar_sharp,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(BlocProvider.value(
                                value: BlocProvider.of<FactBloc>(context),
                                child: const FactScreen(type: FactTypes.random))
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xFFEDD09B), Color(0xFFE7AB42)]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(24))
                            ),
                            child: const ContentFact(
                              title: "Random",
                              desc: 'Get Random Interesting Fact about Numbers!',
                              icon: Icons.help_outline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
