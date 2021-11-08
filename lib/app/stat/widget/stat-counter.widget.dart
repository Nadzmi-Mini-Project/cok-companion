import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatCounterWidget extends StatefulWidget {
  final int? minimum;
  final int? maximum;
  final int? value;
  final Function(int) onChange;

  const StatCounterWidget({
    Key? key,
    required this.onChange,
    this.value,
    this.minimum,
    this.maximum,
  }) : super(key: key);

  @override
  _StatCounterWidgetState createState() => _StatCounterWidgetState();
}

class _StatCounterWidgetState extends State<StatCounterWidget> {
  late int currentValue;
  late int minimumValue;
  late int maximumValue;

  @override
  void initState() {
    super.initState();

    final value = widget.value ?? 0;
    minimumValue = widget.minimum ?? 0;
    maximumValue = widget.maximum ?? 1;

    currentValue = (value <= minimumValue) ? minimumValue : value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionChip(
            label: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                currentValue++;
                currentValue =
                    ((widget.maximum != null) && (currentValue >= maximumValue))
                        ? maximumValue
                        : currentValue;
                widget.onChange(currentValue);
              });
            }),
        Expanded(
          child: Text(
            '$currentValue',
            textAlign: TextAlign.center,
          ),
        ),
        ActionChip(
            label: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                currentValue--;
                currentValue =
                    ((widget.minimum != null) && (currentValue <= minimumValue))
                        ? minimumValue
                        : currentValue;
                widget.onChange(currentValue);
              });
            }),
      ],
    );
  }
}
