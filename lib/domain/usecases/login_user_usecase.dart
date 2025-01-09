import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;
  LoginUser(this.repository);
  Future<Either<Exception, User>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}