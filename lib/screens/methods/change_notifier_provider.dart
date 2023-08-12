import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/controller/provider/number_provider.dart';

final numberNotiefier=ChangeNotifierProvider<NumberProvider>((ref)=>NumberProvider());

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final number=ref.watch(numberNotiefier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change notifier provider'),
      ),body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(number.counter.toString()),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           IconButton(onPressed: (){
             // number.increase();
             ref.read(numberNotiefier).increase();

           }, icon: Icon(Icons.add)),
            IconButton(onPressed: (){
              // number.decrease();
              ref.read(numberNotiefier).decrease();
            }, icon: Icon(Icons.minimize))
          ],
        )
      ],
    ),
    );
  }
}
