class User {
  final String email;
  final String uid;
  final String photUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.uid,
    required this.photUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        "photourl": photUrl,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
}
