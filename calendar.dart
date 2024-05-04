import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc2i/models/even.dart';
import 'package:sc2i/models/even_data.dart';
import 'package:sc2i/models/event_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import "package:table_calendar/table_calendar.dart";
class cal extends StatelessWidget {
  const cal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier'),
      ),
      body: calend(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EventEditPage())),
      ),
    );
  }
}


  class calend extends StatefulWidget {
  const calend({Key? key}) : super(key: key);

  @override
  State<calend> createState() => _calendState();
  }

class _calendState extends State<calend> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate:DateTime.now(),
      cellBorderColor: Colors.transparent,
    );
    child:ChangeNotifierProvider(
      create:(context)=>EventProvider() ,
    );
  }
}

