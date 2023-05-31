import 'package:depinflutter/data/local/local_data.dart';
import 'package:depinflutter/data/remote/remote_data.dart';

import '../model/user.dart';

class UserRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  UserRepository(this.localDataSource, this.remoteDataSource);

  bool hasNetwork = true;

  bool addUser(User user) {
    bool isAdded = false;
    if (hasNetwork) {
      isAdded = remoteDataSource.addUser(user);
    } else {
      isAdded = localDataSource.addUser(user);
    }
    return isAdded;
  }

  List<User> getUsers() {
    if (hasNetwork) {
      return remoteDataSource.getUsers();
    } else {
      return localDataSource.getUsers();
    }
  }
}
