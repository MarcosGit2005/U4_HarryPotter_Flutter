import 'package:dartz/dartz.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetAllCharacters {
  final CharacterRepository repository;
  GetAllCharacters(this.repository);
  Future<Either<Exception, List<Character>>> call() async {
    return await repository.getAllCharacters();
  }
}