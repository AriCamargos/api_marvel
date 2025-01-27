import 'package:api_marvel/domain/entities/characters.dart';

abstract class ApiMarvelDatasource{
  Future<List<CharactersEntity>> getCharacters();
}