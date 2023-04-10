import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
   DatePickerWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime ? _dateTimeSelected ;

  void _datePicker(BuildContext ctx) {
    showDatePicker(context: ctx,
        initialDate: DateTime.utc(2012,4,4),// can implement like this => DateTime.now()
        firstDate: DateTime(2010),
        lastDate: DateTime.now(),
    ).then((value) {

      if (value == null ){return;}
      setState(() {

        _dateTimeSelected = value;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            child: Text(_dateTimeSelected == null?"":DateFormat.yMMM().format(_dateTimeSelected!)),
           onPressed: (){
                _datePicker(context);

           },
          ),
        ),
      );
  }
}
