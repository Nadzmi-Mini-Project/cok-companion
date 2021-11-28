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
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                character.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  character.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
