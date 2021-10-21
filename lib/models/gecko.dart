class Gecko {
  final int? id;
  final String? name;
  final int? age;
  final String? origin;

  final String? color;

  final int? father;

  final int? mother;

  final String? thumbnail;

  final String? images;

  final String? ancestry;
  Gecko({  this.id,  this.name,  this.age, this.origin, this.color, this.father, this.mother,this.thumbnail, this.images, this.ancestry });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'origin': origin,
      'color': color,
      'father': father,
      'mother': mother,
      'thumbnail': thumbnail,
      'images': images,
      'ancestry': ancestry,
    };
  }
  @override
  String toString() {
    return 'Gecko{id: $id, ancestry: $ancestry, name: $name, age: $age, origin: $origin, color: $color, father: $father, mother: $mother, thumbnail: $thumbnail, images: $images}';
  }
}
