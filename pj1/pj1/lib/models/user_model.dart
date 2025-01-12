class UserModel {
  final String uid;
  final String displayName;
  final String email;

  UserModel(
      {required this.uid, required this.displayName, required this.email});

  // Converter um documento Firestore para um objeto UserModel
  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      uid: doc['uid'],
      displayName: doc['displayName'],
      email: doc['email'],
    );
  }

  // Converter um objeto UserModel para um mapa
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
    };
  }
}
