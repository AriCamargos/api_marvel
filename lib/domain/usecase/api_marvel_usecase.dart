import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/domain/repository/api_marvel_repository.dart';

class ApiMarvelUsecase {
  final ApiMarvelRepository _marvelRepository;

  ApiMarvelUsecase({
    required ApiMarvelRepository marvelRepository,
  }) : _marvelRepository = marvelRepository;

  Future<List<CharactersEntity>> call() async {
    return await _marvelRepository.getCharacters();
  }
}
