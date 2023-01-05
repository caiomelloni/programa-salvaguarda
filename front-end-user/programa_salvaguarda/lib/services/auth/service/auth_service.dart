import 'package:programa_salvaguarda/services/auth/repository/auth_stream_repository.dart';
import 'package:programa_salvaguarda/services/auth/store/auth_store.dart';

class AuthService {
  AuthService._();

  static final AuthStreamRepository _authRepository = AuthStreamRepository();
  static final AuthStore _instance = AuthStore(_authRepository);
  static Future<void> initService() => _authRepository.initService();

  static AuthStore get instance => _instance;
  static AuthRepository get service => _authRepository;
}
