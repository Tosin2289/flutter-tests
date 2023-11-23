import 'package:flutter/material.dart';
import 'package:ftests/api_test/user_model.dart';
import 'package:ftests/api_test/user_repository.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<User> getUsers = UserRepository(Client()).getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Test lol"),
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Text(snapshot.data.toString()),
        );
      }),
    );
  }
}
