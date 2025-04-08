class Usuario {
  final int id;
  final String nome;
  final String email;
  final String avatar;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.avatar,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: '${json['first_name']} ${json['last_name']}',
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
