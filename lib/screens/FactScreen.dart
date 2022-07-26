import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:number_facts/blocs/FactBloc.dart';
import 'package:number_facts/screens/FactTypes.dart';
import 'package:number_facts/utilities/Widgets.dart';

class FactScreen extends StatefulWidget {
  const FactScreen({Key? key, required this.type}): super(key: key);
  final FactTypes type;

  @override
  State<FactScreen> createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FactBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF000330),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                (widget.type == FactTypes.date) ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Month',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Day',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ) : const SizedBox(),
                (widget.type == FactTypes.random) ? const SizedBox() : NumberPicker((num) {
                  number = num;
                }),
                const SizedBox(height: 24,),
                InkWell(
                    onTap: () {
                      if(widget.type == FactTypes.date) {
                          int month = int.parse(number.toString().substring(0,2));
                          int day = int.parse(number.toString().substring(2,4));
                          bloc.add(FactEventDate(day: day, month: month));
                      } else {
                        bloc.add(FactEventNumber(type: widget.type, number: number));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent,
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          'Generate',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 24,),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue[900]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<FactBloc, FactState>(builder: (context, state) {
                              if(state is FactStateNeutral) {
                                return const Center(
                                  child: Text(
                                      'Select The Number to First!',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                );
                              } else if(state is FactStateLoading) {
                                return const SpinKitWave(
                                  color: Colors.white,
                                  size: 64,
                                );
                              } else if(state is FactStateError) {
                                return Center(
                                    child: Column(
                                      children: [
                                        LottieBuilder.asset('assets/error.json'),
                                        Text(state.message, style: const TextStyle(color: Colors.white),)
                                      ],
                                    )
                                );
                              } else if(state is FactStateSuccess){
                                String text = state.model.result;

                                return Column(
                                  children: [
                                    const SizedBox(height: 12,),
                                    Text(
                                      widget.type.name.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          text,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox();
                            }),
                          )
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                          onTap: () {
                            bloc.add(FactEventNeutral());
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,
                            ),
                            height: 50,
                            child: const Center(
                              child: Text(
                                'Back To Home',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
