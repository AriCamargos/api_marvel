import 'package:api_marvel/domain/entities/characters.dart';

abstract class ApiMarvelRepository{
  Future<List<CharactersEntity>> getCharacters();
}