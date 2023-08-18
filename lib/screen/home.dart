import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/user_api.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest api call"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final color = user.gender == 'male'? Colors.blue : Colors.pink;
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(user.picture.thumbnail),
          ),
          title: Text(user.fullName),
          subtitle: Text(user.location.country),
          // tileColor: color,
          // leading: ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child: Image.network(imageUrl),
          // ),
          // title: Text(firstName + " " + lastName),
          // subtitle: Text(email),
        );
      },),
    );
  }

  Future<void> fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
