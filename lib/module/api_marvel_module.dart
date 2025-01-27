import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/domain/repository/api_marvel_repository.dart';
import 'package:api_marvel/domain/usecase/api_marvel_usecase.dart';
import 'package:api_marvel/external/datasources/api_marvel_datasource_i.dart';
import 'package:api_marvel/infra/datasources/api_marvel_datasource.dart';
import 'package:api_marvel/infra/datasources/hash.dart';
import 'package:api_marvel/infra/repository/api_marvel_repository.dart';
import 'package:api_marvel/presentation/pages/character_page.dart';
import 'package:api_marvel/presentation/pages/character_state.dart';
import 'package:api_marvel/presentation/pages/details_character_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<KeyApi>((i) => KeyApi()),
        Bind.singleton<CharacterState>(
          (i) => CharacterState(apiMarvelUsecase: i.get<ApiMarvelUsecase>()),
        ),
        Bind.lazySingleton<ApiMarvelDatasource>(
            (i) => ApiMarvelDatasourceImp(keyApi: i.get())),
        Bind.lazySingleton<ApiMarvelRepository>(
          (i) => ApiMarvelRepositoryImp(apiMarvelDatasource: i.get()),
        ),
        Bind.lazySingleton<ApiMarvelUsecase>(
          (i) => ApiMarvelUsecase(marvelRepository: i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CharacterPage(),
        ),
        ChildRoute(
          '/details',
          child: (context, args) => DetailsCharacterPage(
            character: args.data as CharactersEntity,
          ),
        ),
      ];
}
