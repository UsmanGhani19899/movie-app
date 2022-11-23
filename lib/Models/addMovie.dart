class AddMovieModel {
  String? name;
  String? description;
  String? uid;
  String? photo;

  AddMovieModel({
    this.description,
    this.name,
    this.photo,
    this.uid,
  });

  factory AddMovieModel.fromMap(map) {
    return AddMovieModel(
      description: map['description'] ?? "",
      name: map['name'] ?? "",
      photo: map['photo'] ?? "",
      uid: map['uid'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'name': name,
      'photo': photo,
      'uid': uid,
    };
  }
}
