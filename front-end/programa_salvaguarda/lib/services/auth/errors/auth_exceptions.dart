abstract class AuthException {
  String message();
}

//******************
//LOGIN EXCEPTIONS**
//******************

class UserNotFoundAuthException implements Exception, AuthException{
  @override
  String message() {
    return "Ops, este usuário não existe";
  }
}

class WrongPasswordAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Senha errada!";
  }
}
class UserDisabledAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Sua conta foi desabilitada";
  }
}

//*********************
//REGISTER EXCEPTIONS**
//*********************
class WeakPasswordAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Senha fraca";
  }
}

class InsufficientInformationAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Preencha todos os campos";
  }
}

/// Quando a senha e a senha confirmada são diferentes
class WrongPasswordConfimationAuthException implements Exception , AuthException{
  @override
  String message() {
    return "A confirmação de senha está errada";
  }
}

class EmailAlreadyInUseAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Email em uso";
  }
}

class InvalidEmailAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Email inválido";
  }
}

//********************
//GENERIC EXCEPTIONS**
//********************

class GenericAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Ops, ocorreu um erro de autenticação";
  }
}

class UserNotLoggedInAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Você deve se autenticar para isso";
  }
}
