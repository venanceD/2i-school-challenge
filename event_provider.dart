import 'package:flutter/cupertino.dart';

import 'even_e.dart';

class EventProvider extends ChangeNotifier{
final List<Event> _event=[];
List<Event> get events => _event;
 void addEvent(Event event){
   _event.add(event);
   notifyListeners();
 }
}