class User {
  final int id;
  final String name;
  final String dob;
  final String dobTime;

  User({
    required this.id,
    required this.name,
    required this.dob,
    required this.dobTime,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, dob: $dob, dobTime: $dobTime)';
  }
}
