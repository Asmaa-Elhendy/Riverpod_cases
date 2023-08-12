import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../models/usermodel.dart';

final data = FutureProvider.autoDispose<String>(
    (ref) => fetchdata()); //autodispose :reload data every time open screen

Future<String> fetchdata() async {
  // await Future.delayed(Duration(seconds: 2));
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  List data = jsonDecode(response.body);
  List<User> users = data.map((e) => User.fromJson(e)).toList();
  return users[0].body;
}

class FutureProviderWay extends StatelessWidget {
  const FutureProviderWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod with futureProvider'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Consumer(
                builder: (context, ref, child) {
                  return ref.watch(data).when(
                        data: (String value) => Text(value),
                        error: (error, stack) => const Text('error'),
                        loading: () => const CircularProgressIndicator(),
                      );
                },
              ),
            ),
          ]),
    );
  }
}
