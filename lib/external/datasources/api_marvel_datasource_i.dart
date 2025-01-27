import 'dart:convert';

import 'package:api_marvel/domain/entities/characters.dart';
import 'package:api_marvel/external/mappers/characters_mapper.dart';
import 'package:api_marvel/infra/datasources/api_marvel_datasource.dart';
import 'package:api_marvel/infra/datasources/hash.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class ApiMarvelDatasourceImp implements ApiMarvelDatasource {
  final KeyApi _keyApi;

  ApiMarvelDatasourceImp( 
    {
    required  KeyApi keyApi,
  }) : _keyApi = keyApi;

  @override
  Future<List<CharactersEntity>> getCharacters() async {
    final ts = DateTime.now().microsecondsSinceEpoch.toString();
    final String hash =
        _generateHash(ts, _keyApi.keyApiPrivate, _keyApi.keyApiPublic);

    String url =
        'http://gateway.marvel.com/v1/public/characters?ts=$ts&apikey=${_keyApi.keyApiPublic}&hash=$hash';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return _parse(response.body);
    } else {
      throw Exception('Erro ${response.body}');
    }
  }

  String _generateHash(String ts, String privateKey, String publicKey) {
    String toHash = ts + privateKey + publicKey;
    return md5.convert(utf8.encode(toHash)).toString();
  }

  List<CharactersEntity> _parse(String responseBody){
    final Map<String, dynamic> json = jsonDecode(responseBody);
    final List<dynamic> results = json['data']['results'];
    return results.map((e) => CharactersMapper.fromMap(e)).toList();
  }
}
