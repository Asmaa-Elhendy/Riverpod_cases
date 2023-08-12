import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/screens/methods/home.dart';

class SecondWay extends StatelessWidget {
  const SecondWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod 2'),
      ),
      body: Column(children: [
        Center(
          child: Consumer(
            builder: (context, ref, child) {
              return Text(ref.watch(nameProvider));
            },
          ),
        ),
      ]),
    );
  }
}
