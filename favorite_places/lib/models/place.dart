import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Place {
  Place({required this.title}) : id = uuid.v4();

  final String title;
  final String id;
}
