import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/controller/provider/todos_provider.dart';

class NewExample extends ConsumerWidget {
  const NewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final todos_provider=ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Example with Riverpod'),
      ),
      body:todos_provider.todoslist==null?Center(child: CircularProgressIndicator(),):
      todos_provider.todoslist!.isEmpty?Center(child: Text('No data'),):
      ListView.builder(
          itemCount: todos_provider.todoslist!.length,
          itemBuilder: (context,int index){
            return Card(
              child: ListTile(
                leading: Text(todos_provider.todoslist![index].id.toString()),
                title: Text(todos_provider.todoslist![index].title),
                subtitle: Text(todos_provider.todoslist![index].completed.toString(),style: TextStyle(fontWeight: FontWeight.w300),),
              ),
            );
          }),
    );
  }
}
