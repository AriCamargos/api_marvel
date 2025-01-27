
import 'package:api_marvel/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class CharactersEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final ImageEntity image;

  const CharactersEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
      ];

}
