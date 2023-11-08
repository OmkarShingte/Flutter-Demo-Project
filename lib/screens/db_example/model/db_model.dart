final String tableDemo = 'demoTable';

class DbFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class DbModel {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const DbModel({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  DbModel copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      DbModel(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static DbModel fromJson(Map<String, Object?> json) => DbModel(
        id: json[DbFields.id] as int?,
        isImportant: json[DbFields.isImportant] == 1,
        number: json[DbFields.number] as int,
        title: json[DbFields.title] as String,
        description: json[DbFields.description] as String,
        createdTime: DateTime.parse(json[DbFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        DbFields.id: id,
        DbFields.title: title,
        DbFields.isImportant: isImportant ? 1 : 0,
        DbFields.number: number,
        DbFields.description: description,
        DbFields.time: createdTime.toIso8601String(),
      };
}
