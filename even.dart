import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc2i/models/utils.dart';
import 'even_e.dart';

import 'event_provider.dart';
class EventEditPage extends StatefulWidget {
  final Event? even;

   const EventEditPage({
Key? key,
     this.even,
}): super(key:key);
  @override
  State<EventEditPage> createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> {
  final _formKey=GlobalKey<FormState>();
  final titleController=TextEditingController();
    late DateTime fromDate;
    late DateTime toDate;
  @override

  void initState(){
    super.initState();

    if(widget.even==null){
      fromDate=DateTime.now();
      toDate=DateTime.now().add(Duration(hours: 2));
    }
  }

  void dispose(){
    titleController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
leading: CloseButton(),
      actions: buildEditingActions(),

    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child:Form(
        key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:<Widget>[
          buildTitle(),
          SizedBox(height: 12,),
          buildDateTimePickers(),
        ],
      ) ,
      ),
    ),
  );
  List<Widget>buildEditingActions() =>[
    ElevatedButton.icon(style: ElevatedButton.styleFrom(primary: Colors.transparent,shadowColor: Colors.transparent),
      onPressed: saveFrom, icon:Icon(Icons.done),label:Text("Save"),)
  ];
  Widget buildTitle()=> TextFormField(
    style: TextStyle(fontSize: 24),
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Ajoute un titre'
    ),
    onFieldSubmitted: (_) => saveFrom(),
    validator: (title) =>
    title!=null && title.isEmpty?'le titre est null':null ,   controller: titleController,
  );
  Widget  buildDateTimePickers() => Column(
    children: [
     buildFrom(),
      buildTo(),
    ],
  );
  Widget buildFrom() =>buildHeader(
     header:'Pour',
    child :Row(
    children: [
      Expanded(flex:2,child: buildDropDownField(
        text:Utils.toDate(fromDate),
        onClicked:() => pickFromDateTime(pickDate: true),
      )),
      Expanded(child:buildDropDownField(
text: Utils.toTime(fromDate),
        onClicked: () => pickFromDateTime(pickDate: false),
      ) ),
    ],
  ),
  );
  Widget buildTo() =>buildHeader(
      header:'Au',
      child :Row(
        children: [
          Expanded(flex:2,child: buildDropDownField(
            text:Utils.toDate(toDate),
            onClicked:() => pickFromDateTime(pickDate: true),
          )),
          Expanded(child:buildDropDownField(
            text: Utils.toTime(toDate),
            onClicked: () => pickFromDateTime(pickDate: false),
          ) ),
        ],
      ),
  );
  Future pickFromDateTime({required bool pickDate}) async{
    final date =await pickDateTime(fromDate,pickDate:pickDate);
    if(date==null) return;
    if(date.isAfter(toDate)){
      DateTime(date.year,date.month,date.day,toDate.hour,toDate.minute);
    }
    setState(()=>fromDate=date);
}
Future pickToDateTime({required bool pickDate})async{
 final date= await pickDateTime(toDate,pickDate: pickDate,firstDate: pickDate?fromDate:null,);
 if(date==null) return;
 setState(()=> toDate=date);
}
Future<DateTime?>pickDateTime(
    DateTime initialDate,{
      required bool pickDate,
      DateTime?firstDate,
  }
    )
  async{
if(pickDate){
  final date =await showDatePicker(context: context, initialDate: initialDate,
      firstDate: firstDate??DateTime(2015,8), lastDate:DateTime(2101),);
  if(date==null) return null;
  final time= Duration(hours: initialDate.hour,minutes: initialDate.minute);
  return date.add(time);
}else{
  final timeOfday= await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(initialDate));

  if(timeOfday==null) return null;
    final date= DateTime(initialDate.year,initialDate.month,initialDate.day);
    final time =Duration(hours: timeOfday.hour,minutes: timeOfday.minute,);
    return date.add(time);

}
}

  Widget buildDropDownField({
    required String text,
    required VoidCallback onClicked,
})=>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );
  Widget buildHeader({
    required String header,
    required Widget child,

})=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(header,style: TextStyle(fontWeight:FontWeight.bold),),
      child,
    ],
  );
  Future saveFrom() async{
    final isValid= _formKey.currentState!.validate();
    if(isValid){
      final even=Event(
        title:titleController.text,
        description:'description',
        from:fromDate,
        to:toDate,
        isAllday:false,
      );
      final provider=Provider.of(context,listen: true);
      provider.addEvent(even);

      Navigator.of(context).pop();
    }
  }
}

