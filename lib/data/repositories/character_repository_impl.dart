import 'package:dartz/dartz.dart';
import '../datasources/character_remote_datasource.dart';
import '../../domain/entities/character.dart';
import'../../domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  CharacterRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Exception, List<Character>>> getAllCharacters() async {
    try {
      final characterModels = await remoteDataSource.getAllCharacters();
      return Right(characterModels.map((model) =>
          Character(name: model.name, house: model.house,
              image: model.image.isNotEmpty?model.image:'https://ik.imagekit.io/hpapi/hagrid.png',
              wand: 'Wand[${model.wand['wood']==null||model.wand['wood']==""?"No wood":model.wand['wood']}, '
                  '${model.wand['core']==null||model.wand['core']==""?"No core":model.wand['core']}, '
                  '${model.wand['length'] ?? 5}]')
      ).toList());
    } catch (e) {
      return Left(Exception('Error al cargar personajes'));
    }
  }
}