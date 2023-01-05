import 'package:projeto_salvaguarda_admin/services/auth/repository/auth_stream_repository.dart';
import 'package:projeto_salvaguarda_admin/services/auth/store/auth_store.dart';

class AuthService {
  AuthService._();

  ///TODO: implementar autenticacao e esconder o token no db com cryptografia, como foi feito no app de user
   static const String admToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzAyOTcwMDUsInVzZXJJRCI6MywiaXNBZG1pbiI6dHJ1ZX0.eR0cVTzzBmldpxZvnSVKqEGGK0cKTSNeM_Ln9q6BmLM";

  static final AuthStreamRepository _authRepository = AuthStreamRepository();
  static Future<void> initService() => _authRepository.initService();
  static final AuthStore _instance = AuthStore(_authRepository);

  static AuthStore get instance => _instance;
  static AuthRepository get service => _authRepository;
}
