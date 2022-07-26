import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NumberUtil.dart';

class NumberPicker extends StatelessWidget {
  NumberPicker(this.onChange, {Key? key}) : super(key: key);
  final Function(int) onChange;
  final NumberUtil numberUtil = NumberUtil(0, 4);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        GestureDetector(
          onTap: () {
            setState(() {
              (digit < 9) ? ++digit : digit;
              widget.callback(digit);
            });
          },
            child: const Icon(Icons.arrow_circle_up_rounded)
        ),
        Card(
          child: Center(
            child: Text(
              digit.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                (digit > 0) ? --digit : digit;
                widget.callback(digit);
              });
            },
            child: const Icon(Icons.arrow_circle_down_rounded)
        ),
      ],
    );
  }
}
