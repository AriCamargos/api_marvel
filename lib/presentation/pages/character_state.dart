import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/domain/usecase/api_marvel_usecase.dart';
import 'package:flutter/material.dart';

class CharacterState extends ChangeNotifier {
  final ApiMarvelUsecase _apiMarvelUsecase;

  CharacterState({
    required ApiMarvelUsecase apiMarvelUsecase,
  }) : _apiMarvelUsecase = apiMarvelUsecase;

  Future<List<CharactersEntity>> getCharacters() async {
    try {
      return await _apiMarvelUsecase();
    } catch (e) {
      rethrow;
    }
  }

}
