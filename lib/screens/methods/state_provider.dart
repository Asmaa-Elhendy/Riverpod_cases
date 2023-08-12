// this way to  catch state(value) of provider and edit it

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<int>((ref) => 0);

class StateProviderWay extends StatelessWidget {
  const StateProviderWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod with stateprovider'),
      ),
      body: Column(children: [
        Center(
          child: Consumer(
            builder: (context, ref, child) {
              return Text(ref.watch(numberProvider).toString());
            },
          ),
        ),
      ]),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ref.watch(numberProvider.notifier).state++;
          },
        ),
      ),
    );
  }
}
