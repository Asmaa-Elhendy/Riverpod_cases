import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/models/Todos_model.dart';

final todosProvider =ChangeNotifierProvider<TodosProvider>((ref)=>TodosProvider());
    
 class TodosProvider extends  ChangeNotifier{
   List<Todos>? todoslist;

   TodosProvider(){   // constructor , here we call as in initstate
     getDataFromApi();
   }
   getDataFromApi()async{
     var res=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
     List data=json.decode(res.body);
    todoslist= data.map((e) => Todos.fromJson(e)).toList();
    notifyListeners();
   }
 }