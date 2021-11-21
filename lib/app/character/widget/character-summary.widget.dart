import 'package:cokc/app/character/model/character.model.dart';
import 'package:flutter/material.dart';

class CharacterSummaryWidget extends StatelessWidget {
  final CharacterModel character;
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
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                character.imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(character.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
