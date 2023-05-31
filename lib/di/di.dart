import 'package:depinflutter/data/local/local_data.dart';
import 'package:depinflutter/data/remote/remote_data.dart';
import 'package:depinflutter/repo/user_repo.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

initModules() {
  getIt.registerSingleton<LocalDataSource>(LocalDataSource());
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());
  getIt.registerSingleton<UserRepository>(
    UserRepository(
      getIt<LocalDataSource>(),
      getIt<RemoteDataSource>(),
    ),
  );
}
