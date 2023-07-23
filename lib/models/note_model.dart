import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  @override
  @HiveField(4)
  late String key;
  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  }) {
    key = const Uuid().v4(); // Generate a unique key for each NoteModel
  }
}
