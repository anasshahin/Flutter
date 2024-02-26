import 'package:expenses_work/chart/chart.dart';
import 'package:flutter/material.dart';

import '../models/expanse.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpense = [
    Expense(
        title: 'Meat',
        amount: 12.5,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Api course',
        amount: 10,
        date: DateTime.utc(2020),
        category: Category.work),
    Expense(
        title: 'Saudi arabia travel ',
        amount: 2000,
        date: DateTime.utc(2021),
        category: Category.travel),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registerExpense.remove(expense);
      print(_registerExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Expenses'), centerTitle: true, actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) => SizedBox(
                      height: 400,
                      child: NewExpense(
                        onAddExpense: _addExpense,
                      ),
                    ));
          },
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [
          Chart(expenses: _registerExpense),
          Expanded(
            child: ListView.builder(
              itemCount: _registerExpense.length,
              itemBuilder: (ctx, index) => Dismissible(
                  background: Container(
                    color: Theme.of(context).colorScheme.error.withOpacity(0.7),
                    margin: EdgeInsets.symmetric(
                        horizontal: Theme.of(context).cardTheme.margin!.horizontal),
                  ),
                  key: ValueKey(_registerExpense[index]),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        _registerExpense[index].title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Row(children: [
                        Text(
                            'price :\$ ${_registerExpense[index].amount.toStringAsFixed(2)}'),
                        const Spacer(),
                        Icon(iconsCategory[_registerExpense[index].category]),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('Date : ${_registerExpense[index].formattedDate}')
                      ]),
                    ),
                  ),
                  onDismissed: (direction) =>
                      _removeExpense(_registerExpense[index])),
            ),
          ),
        ],
      ),
    );
  }
}
