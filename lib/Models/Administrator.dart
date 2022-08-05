class Administrator {
  String nickname;
  String email;
  String password;
  int guildId;
  bool logedIn;

  Administrator(
      {required this.nickname,
      required this.email,
      required this.password,
      required this.guildId,
      required this.logedIn});

  factory Administrator.fromMap(Map<String, dynamic> json) => Administrator(
      nickname: json['nickname'],
      email: json['email'],
      password: json['password'],
      guildId: json['guildId'],
      logedIn: json['logedIn']);

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'email': email,
      'password': password,
      'guildId': guildId,
      'logedIn': logedIn,
    };
  }
}
