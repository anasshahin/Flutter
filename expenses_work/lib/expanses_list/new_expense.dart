import 'dart:developer' as dev;

import '../models/expanse.dart' as mod;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expanse.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key, required this.onAddExpense,
  });
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _controllerTitle = TextEditingController();
  final _controllerAmount = TextEditingController();
  DateTime? _dateTime;
  mod.Category? _selectedCategory;
  @override
  void dispose() {
    super.dispose();
    _controllerTitle.dispose();
    _controllerAmount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dataFiller(_controllerTitle, "Title", 'text'),
        Row(children: [
          Expanded(child: dataFiller(_controllerAmount, "Amount", 'number')),
          TextButton.icon(
            onPressed: () async {
              final toDay = DateTime.now();
              final firstDate = DateTime(toDay.year - 1);
              final lastDate = DateTime(toDay.year + 5);

              DateTime? dateTime = await showDatePicker(
                  context: context, firstDate: firstDate, lastDate: lastDate);
              setState(() {
                _dateTime = dateTime;
              });
            },
            icon: const Icon(Icons.calendar_month),
            label: Text(_dateTime == null
                ? 'Select date'
                : DateFormat.yMd().format(_dateTime!)),
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(

                decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(1, 1))]
          ),

                child: DropdownButton(
                  value: _selectedCategory,
                    items: mod.Category.values
                        .map((e) => DropdownMenuItem(value: e,child: Text(e.name),))
                        .toList()
                    ,
                    onChanged: (newVal){
                    setState(() {
                      if (newVal == null)return;
                      _selectedCategory = newVal;
                    });
                    }),
              ),
              const Spacer(),
              ElevatedButton(onPressed: () {
                final double ? enteredAmount = double.tryParse(_controllerAmount.text) ;
                if ( _controllerTitle.text.trim().isEmpty) {
                  errorDialog(context,'Empty title',
                      'Please insert title for your expense');
                } else if ( enteredAmount== null ){
                  errorDialog(context,'Incorrect amount value',
                      'Please insert valid amount value ( numbers )');
                             }
                else if (_selectedCategory== null  ){
                  errorDialog(context,'There is no selected category',
                      'Please select category for your expense');                }
                else if (_dateTime == null){
                  errorDialog(context,'There is no selected date',
                      'Please select date for your expense');  }
                else{
                  Expense expense=Expense(amount:enteredAmount,category: _selectedCategory!,date:_dateTime!,title:_controllerTitle.text   );
                  widget.onAddExpense(expense);
                }
              }, child: const Text('Send expanse')),
              const SizedBox(width: 10),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'))
            ],
          ),
        ),
      ],
    );
  }

  void errorDialog(BuildContext context,title,content) {
     showDialog(context: context, builder: (ctx)=> AlertDialog(
      title: Text(title),
      content:Text(content) ,
      actions: [ElevatedButton(onPressed: ()=> Navigator.of(context).pop(),
          child: const Text('Okay'))],
    ));
  }

  Padding dataFiller(controller, text, type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: TextField(
        controller: controller,
        keyboardType:
            type == "number" ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          prefixText: type == "number" ? "\$ " : null,
          label: Text(text),
        ),
      ),
    );
  }
}
