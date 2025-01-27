import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/presentation/pages/character_state.dart';
import 'package:api_marvel/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    super.key,
  });

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late Future<List<CharactersEntity>> _charactersFuture;
  @override
  void initState() {
    super.initState();

    final characterState = Modular.get<CharacterState>();
    _charactersFuture = characterState.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          title: Center(
            child: Image.asset(
              'images/Marvel_Logo.png',
              height: 100,
              width: 100,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<CharactersEntity>>(
                future: _charactersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Erro ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    final characters = snapshot.data ?? [];

                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              child: Text(
                                'Character feature'.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        HorizontalList(characters: characters),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              child: Text(
                                'Marvel characters lista'.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalList(characters: characters),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('Nenhum personagem encontrado'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    super.key,
    required this.characters,
  });

  final List<CharactersEntity> characters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 30,
            width: 180,
            child: CharacterCard(
              name: characters[index].name,
              path: characters[index].image.path,
              extension: characters[index].image.extension,
              character: characters[index],
            ),
          );
        },
      ),
    );
  }
}

class VerticalList extends StatelessWidget {
  const VerticalList({
    super.key,
    required this.characters,
  });

  final List<CharactersEntity> characters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          child: SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //numero de colunas
                crossAxisSpacing: 10, //espaço horizontal
                mainAxisSpacing: 10, //espaço vertical
                childAspectRatio: 1, //proporção
              ),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(
                  name: characters[index].name,
                  path: characters[index].image.path,
                  extension: characters[index].image.extension,
                  character: characters[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
