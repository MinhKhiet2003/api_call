class UserDob {
  final DateTime date;
  final int age;
  UserDob({
    required this.date,
    required this.age,
  });
  factory UserDob.fromMap(Map<String, dynamic> e){
    return UserDob(
      age: e['age'],
      date: DateTime.parse(e['date']),
    );
  }
}