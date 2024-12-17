class AppModel {
  final int id;
  final String name;
  final bool isSelected;

  AppModel({required this.id, required this.name, required this.isSelected});

  AppModel copyWith({int? id, String? name, bool? isSelected}) {
    return AppModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

