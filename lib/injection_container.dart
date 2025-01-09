import 'package:u4_harrypotter_marcos_rubio_diaz/data/datasources/character_remote_datasource.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/data/datasources/login_fake_datasource.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/data/repositories/login_repository_impl.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/data/repositories/character_repository_impl.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/domain/repositories/login_repository.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/domain/repositories/character_repository.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/domain/usecases/get_all_characters_usecase.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/domain/usecases/login_user_usecase.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/presentation/blocs/characters/character_bloc.dart';
import 'package:u4_harrypotter_marcos_rubio_diaz/presentation/blocs/login/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;
Future<void> init() async {
// BloC
  sl.registerFactory(() => CharacterBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl(), sl()));
// Casos de uso
  sl.registerLazySingleton(() => GetAllCharacters(sl()));
  sl.registerLazySingleton(() => LoginUser(sl()));
// Repositorios
  sl.registerLazySingleton<CharacterRepository>(
          () => CharacterRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(sl(), sl()),
  );
// Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
        () => CharacterRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<LoginFakeDatasource>(
        () => LoginFakeDatasourceImpl(),
  );
// Cliente HTTP
  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}