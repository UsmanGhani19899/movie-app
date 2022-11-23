class TicketModel {
  String? name;
  String? email;
  String? uid;
  String? photo;

  TicketModel({
    this.email,
    this.name,
    this.photo,
    this.uid,
  });

  factory TicketModel.fromMap(map) {
    return TicketModel(
      email: map['email'] ?? "",
      name: map['name'] ?? "",
      photo: map['photo'] ?? "",
      uid: map['uid'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'photo': photo,
      'uid': uid,
    };
  }
}
