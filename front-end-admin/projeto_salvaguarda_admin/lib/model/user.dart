class User {
  final String name;
  final String cargo;
  final DateTime ultimaAtualizacao;
  final String email;
  final String telefone;
  final String curso;
  final int horasCumpridas;
  final String universidade;

  User({
    required this.name,
    required this.cargo,
    required this.ultimaAtualizacao,
    required this.email,
    required this.telefone,
    required this.curso,
    required this.horasCumpridas,
    required this.universidade,
  });

  User copy({
    String? name,
    String? cargo,
    DateTime? ultimaAtualizacao,
    String? email,
    String? telefone,
    String? curso,
    int? horasCumpridas,
    String? universidade,
  }) =>
      User(
        name: name ?? this.name,
        cargo: cargo ?? this.cargo,
        ultimaAtualizacao: ultimaAtualizacao ?? this.ultimaAtualizacao,
        email: email ?? this.email,
        telefone: telefone ?? this.telefone,
        curso: curso ?? this.curso,
        horasCumpridas: horasCumpridas ?? this.horasCumpridas,
        universidade: universidade ?? this.universidade,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          cargo == other.cargo &&
          ultimaAtualizacao == other.ultimaAtualizacao &&
          email == other.email &&
          telefone == other.telefone &&
          curso == other.curso &&
          horasCumpridas == other.horasCumpridas &&
          universidade == other.universidade;

  @override
  int get hashCode =>
      name.hashCode ^
      cargo.hashCode ^
      ultimaAtualizacao.hashCode ^
      email.hashCode ^
      telefone.hashCode ^
      curso.hashCode ^
      horasCumpridas.hashCode ^
      universidade.hashCode;
}
