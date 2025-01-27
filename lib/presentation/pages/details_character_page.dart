import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/presentation/widgets/data_text.dart';
import 'package:flutter/material.dart';

class DetailsCharacterPage extends StatelessWidget {
  final CharactersEntity character;
  const DetailsCharacterPage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final parseImage = '${character.image.path}.${character.image.extension}';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Image.asset(
            'images/Marvel_Logo.png',
            height: 40,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                parseImage,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromARGB(248, 30, 30, 30).withOpacity(0.8),
                      const Color.fromARGB(35, 0, 0, 0),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[850],
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Space(height: 10),
                  Text(
                    character.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const Space(height: 10),
                  Text(
                    'Biography'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  DataText(
                    title: 'Biography'.toUpperCase(),
                    text: character.description,
                  ),
                  const Space(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
