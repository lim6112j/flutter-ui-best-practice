class Gecko {
  final int? id;
  final String? name;
  final int? age;
  final String? origin;
  Gecko({ this.id,  this.name,  this.age, this.origin});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'origin': origin,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age, origin: $origin}';
  }
}
