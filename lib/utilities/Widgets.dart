import 'package:flutter/material.dart';

import 'NumberUtil.dart';

class NumberPicker extends StatelessWidget {
  NumberPicker(this.onChange, {Key? key}) : super(key: key);
  final Function(int) onChange;
  final NumberUtil numberUtil = NumberUtil();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DigitPicker((i) {
          onChange(numberUtil.setDigit(0, i));
        }),
        DigitPicker((i) {
          onChange(numberUtil.setDigit(1, i));
        }),
        DigitPicker((i) {
          onChange(numberUtil.setDigit(2, i));
        }),
        DigitPicker((i) {
          onChange(numberUtil.setDigit(3, i));
        }),
      ],
    );
  }
}

class DigitPicker extends StatefulWidget {
  const DigitPicker(this.callback, {Key? key}) : super(key: key);
  final Function(int) callback;

  @override
  _DigitPickerState createState() => _DigitPickerState();
}

class _DigitPickerState extends State<DigitPicker> {
  int digit = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
            setState(() {
              (digit < 9) ? ++digit : digit;
              widget.callback(digit);
            });
          },
            child: const Icon(Icons.arrow_circle_up_rounded,color: Colors.white,size: 48,)
        ),
        Card(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                digit.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 42
                ),
              ),
            ),
          ),
        ),
        InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              setState(() {
                (digit > 0) ? --digit : digit;
                widget.callback(digit);
              });
            },
            child: const Icon(Icons.arrow_circle_down_rounded,color: Colors.white,size: 48,)
        ),
      ],
    );
  }
}

class ContentFact extends StatelessWidget {
  const ContentFact({Key? key, required this.title, required this.desc, required this.icon}) : super(key: key);
  final String title, desc;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            desc,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 16
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(icon,size: 64),
              ],
            ),
          )
        ],
      ),
    );
  }
}

