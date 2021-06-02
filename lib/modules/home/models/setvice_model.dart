import 'package:flutter/foundation.dart' show required;

class ServiceModel {
  final int id;
  final String iamge, title, description;
  ServiceModel(
      {@required this.id,
      @required this.iamge,
      @required this.title,
      @required this.description});
}
