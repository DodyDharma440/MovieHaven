import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_haven/app/modules/Auth/services/auth_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

class AppAuthService extends BaseService implements AuthService {
  @override
  Future<UserCredential> login({required Map<String, dynamic> body}) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: body['email'],
      password: body['password'],
    );
  }

  @override
  Future<UserCredential> register({required Map<String, dynamic> body}) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: body['email'],
      password: body['password'],
    );
  }
}
