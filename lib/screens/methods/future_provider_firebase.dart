import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

final data = FutureProvider.autoDispose<QuerySnapshot>(
    (ref) => firestore.collection("users").get());

class FutureProviderFirebase extends ConsumerWidget {
  const FutureProviderFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('futureProvider with firebase'),
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
        // model couldn't fit here
        //  List<User> e=  value.docs.map((DocumentSnapshot e) {
        // Map<String, dynamic> data = e.data()! as Map<String, dynamic>;
        //      User.fromJson(data);}).cast<User>().toList();

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
