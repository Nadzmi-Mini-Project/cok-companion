import 'package:flutter/cupertino.dart';

class StatWidget extends StatelessWidget {
  final String imagePath;
  final int value;

  const StatWidget({
    required this.imagePath,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Text(value.toString()),
      ],
    );
  }
}
