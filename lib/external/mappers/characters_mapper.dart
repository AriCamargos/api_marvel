import 'package:api_marvel/domain/entities/characters.dart';

import 'image_mapper.dart';

class CharactersMapper {
  static CharactersEntity fromMap(Map<String, dynamic> map) {
    return CharactersEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: ImageMapper.fromMap(map['thumbnail']),
    );
  }
}
