class Gecko {
  final int? id;
  final String? name;
  final int? age;
  final String? origin;

  final String? color;

  final int? father;

  final int? mother;
  Gecko({ this.id,  this.name,  this.age, this.origin, this.color, this.father, this.mother});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'origin': origin,
      'color': color,
      'father': father,
      'mother': mother,
    };
  }

  @override
  String toString() {
    return 'Gecko{id: $id, name: $name, age: $age, origin: $origin, color: $color, father: $father, mother: $mother}';
  }
}
