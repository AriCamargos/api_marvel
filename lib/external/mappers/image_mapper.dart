import 'package:api_marvel/domain/entities/image_entity.dart';

class ImageMapper {
  static ImageEntity fromMap(Map<String, dynamic> map) {
    return ImageEntity(
      path: map['path'],
      extension: map['extension'],
    );
  }
}
