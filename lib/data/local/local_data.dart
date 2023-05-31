import '../../model/user.dart';

class LocalDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Local John',
      dob: '01/01/1990',
      dobTime: '12:00',
    ),
    User(
      id: 2,
      name: 'Local Jane',
      dob: '01/01/1995',
      dobTime: '12:00',
    ),
  ];

  bool addUser(User user) {
    users.add(user);
    return true;
  }

  List<User> getUsers() {
    return users;
  }
}
