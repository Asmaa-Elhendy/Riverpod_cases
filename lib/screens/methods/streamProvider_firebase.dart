import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

CollectionReference users = FirebaseFirestore.instance.collection("users");

final data = StreamProvider.autoDispose<QuerySnapshot>(
    (ref) => users.snapshots()); // snapshots dealing already with streams

class StreamProviderFirebase extends ConsumerWidget {
  const StreamProviderFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider with firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: SizedBox(height: 250, child: _buildwidget(ref))),
            ]),
      ),
    );
  }
}

Widget _buildwidget(WidgetRef ref) {
  final users = ref.watch(data);
  return users.when(
      data: (QuerySnapshot value) {
        return ListView.builder(
            itemCount: value.docs.length,
            itemBuilder: (context, i) => Row(
                  children: [
                    Text(value.docs[i]['title']),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(value.docs[i]['body']),
                  ],
                ));
      },
      error: (error, stack) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()));
}
