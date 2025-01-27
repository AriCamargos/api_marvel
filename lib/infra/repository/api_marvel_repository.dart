import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/domain/repository/api_marvel_repository.dart';
import 'package:api_marvel/infra/datasources/api_marvel_datasource.dart';

class ApiMarvelRepositoryImp implements ApiMarvelRepository {
  final ApiMarvelDatasource _apiMarvelDatasource;

  const ApiMarvelRepositoryImp({
    required ApiMarvelDatasource apiMarvelDatasource,
  }) : _apiMarvelDatasource = apiMarvelDatasource;

  @override
  Future<List<CharactersEntity>> getCharacters() async {
    return await _apiMarvelDatasource.getCharacters();
  }
}
