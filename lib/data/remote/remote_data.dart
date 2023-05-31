import '../../model/user.dart';

class RemoteDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Remote Salman',
      dob: '01/01/1990',
      dobTime: "11:25",
    ),
    User(
      id: 2,
      name: 'Remote katrina',
      dob: '01/01/1990',
      dobTime: "03:25",
    ),
    User(
      id: 3,
      name: 'Remote Vicky',
      dob: '01/01/1990',
      dobTime: "12:12",
    )
  ];

  // Add user
  bool addUser(User user) {
    users.add(user);
    return true;
  }

  // Get user
  List<User> getUsers() {
    return users;
  }
}
