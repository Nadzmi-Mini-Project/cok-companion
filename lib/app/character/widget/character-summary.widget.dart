import 'package:cokc/app/character/entity/character.entity.dart';
import 'package:flutter/material.dart';

class CharacterSummaryWidget extends StatelessWidget {
  final CharacterEntity character;
  final VoidCallback? onTap;

  const CharacterSummaryWidget({
    Key? key,
    required this.character,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap!,
        child: Stack(
          children: [
            Image.asset(character.imagePath),
            Text(character.name),
          ],
        ),
      ),
    );
  }
}
