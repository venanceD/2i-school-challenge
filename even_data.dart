

import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'even_e.dart';

class EventDataSource extends CalendarDataSource{
EventDataSource(List<Event>appointments){
  this.appointments = appointments;
}
Event getEvent(int index) => appointments![index] as Event;
DateTime getStarTime(int index)=> getEvent(index).from;
DateTime getEndTime(int index)=> getEvent(index).to;
String getSubject (int index)=> getEvent(index).title;
Color getColor(int index) => getEvent(index).backgroundColors;
bool isAllday(int index) => getEvent(index).isAllday;
}