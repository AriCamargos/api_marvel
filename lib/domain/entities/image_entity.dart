import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String path;
  final String extension;

  const ImageEntity({
    required this.path,
    required this.extension,
  });

  @override
  List<Object?> get props => [
        path,
        extension,
      ];
}
