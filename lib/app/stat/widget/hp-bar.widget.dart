import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HpBarWidget extends StatelessWidget {
  final int currentHp, maximumHp;

  const HpBarWidget({
    Key? key,
    required this.currentHp,
    required this.maximumHp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: Image.asset(
            'asset/image/character/sample-icon.jpg', // TODO: use real icon
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 17.0,
                child: LinearProgressIndicator(
                  value: (currentHp / maximumHp).toDouble(),
                  backgroundColor: Colors.red,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text('$currentHp / $maximumHp'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
