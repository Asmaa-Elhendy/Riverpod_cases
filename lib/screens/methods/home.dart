import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/screens/methods/future_provider_api.dart';
import 'package:study_riverpod/screens/methods/future_provider_firebase.dart';
import 'package:study_riverpod/screens/methods/second_way.dart';
import 'package:study_riverpod/screens/methods/state_provider.dart';
import 'package:study_riverpod/screens/methods/streamProvider_firebase.dart';

import '../widgets/home_button.dart';
import 'change_notifier_provider.dart';
import 'combinigProvider.dart';

final nameProvider = Provider<String>((ref) => 'asmaa');

// rebuild the entire screen with ConsumerWidget
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Riverpod',
      )),
      body: ListView(
       children: [
         Column(
           children: [
             Center(
               child: Text(name),
             ),
             const SizedBox(
               height: 35,
             ),
             customButton(context, 'second way - provider_with_consumer', SecondWay()),
             customButton(context, 'StateProviderWay', StateProviderWay()),
             customButton(context, 'futureProviderWay', FutureProviderWay()),
             customButton(context, 'futureProvider_firebase', FutureProviderFirebase()),
             customButton(context, 'streamProvider_firebase', StreamProviderFirebase()),
             customButton(context, 'CombiningProvider', CombinigProvider()),
             customButton(context, 'ChangeNotifierProvider', ChangeNotifierPage()),
           ],
         ),
       ],
      ),
    );
  }
}
