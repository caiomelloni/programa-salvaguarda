abstract class AuthException {
  String message();
}

//******************
//LOGIN EXCEPTIONS**
//******************
class UserNotFoundAuthException implements Exception, AuthException{
  @override
  String message() {
    return "User Not Found";
  }
}

class WrongPasswordAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Wrong Password";
  }
}
class UserDisabledAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Disabled Account";
  }
}
class UserBannedAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Banned Account";
  }
}

//*********************
//REGISTER EXCEPTIONS**
//*********************
class WeakPasswordAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Weak Password";
  }
}

class InsufficientInformationAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Insufficient Information";
  }
}

class EmailAlreadyInUseAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Email Already In Use";
  }
}

class InvalidEmailAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Invalid Email";
  }
}

//********************
//GENERIC EXCEPTIONS**
//********************

class GenericAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Unknow Auth Server Error";
  }
}

class UserNotLoggedInAuthException implements Exception , AuthException{
  @override
  String message() {
    return "Not Authorized";
  }
}
