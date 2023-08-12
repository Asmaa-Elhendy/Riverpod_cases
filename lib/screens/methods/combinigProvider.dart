import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider= StateProvider<String>((ref)=>'country 1');

final weatherProvider=Provider<String>((ref){
  final city= ref.watch(cityProvider);
  return city=='country 1'?'20':city=='country 2'?'40':'60';
});

class CombinigProvider extends ConsumerWidget {
  const CombinigProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
 final city= ref.watch(cityProvider);
 final weather= ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('CombinigProvider'),
      ),body: Column(
        children: [
          Center(child:Column(
            children: [
              DropdownButton(
                  value: city,
                  items: const [
                    DropdownMenuItem(value: 'country 1',child: Text('country 1'),),
                    DropdownMenuItem(value: 'country 2',child: Text('country 2'),),
                    DropdownMenuItem(value: 'country 3',child: Text('country 3'),),
                  ], onChanged: (value){
                    ref.watch(cityProvider.notifier).state=value!;
              },

              ),const SizedBox(height: 100,),
              Text(weather)
             ],
          )
            ,
          ),]

    ),);
  }
}
