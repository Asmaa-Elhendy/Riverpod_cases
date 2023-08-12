import 'package:flutter/material.dart';

Widget customButton(context,String title , page){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>page));
      },
      child: Container(
        height: 60,width: 260,
        color: Colors.blueGrey,
        child: Center(child: Text(title,style: TextStyle(color: Colors.white),),),
      ),
    ),
  );
}