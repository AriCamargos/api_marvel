import 'package:api_marvel/domain/entities/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final String path;
  final String extension;
  final CharactersEntity character;

  const CharacterCard({
    super.key,
    required this.path,
    required this.extension,
    required this.name,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final parseImage = "$path.$extension";

    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          '/details',
          arguments: character,
        );
      },
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                    bottom:  Radius.circular(12),
                  ),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Expanded(
                      child: Image.network(
                        parseImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
