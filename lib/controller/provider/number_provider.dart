
import 'package:flutter/cupertino.dart';

class NumberProvider extends ChangeNotifier{

   int counter=0;

   void increase(){
     counter++;
     notifyListeners();
   }
   void decrease(){
     counter--;
     notifyListeners();
   }
}