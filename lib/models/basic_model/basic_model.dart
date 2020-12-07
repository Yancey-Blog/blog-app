import 'package:meta/meta.dart';

class BasicModel {
  final String id;
  final String createdAt;
  final String updatedAt;

  BasicModel({
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
  });
}
