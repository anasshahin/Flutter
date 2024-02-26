import 'package:expenses_work/chart/chart_bar.dart';
import 'package:flutter/material.dart';

import '../models/expanse.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<dynamic> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var e in buckets) {
      if (e.totalExpenses > maxTotalExpense) maxTotalExpense = e.totalExpenses;
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var ele in buckets)
                ChartBar(
                  fill:ele.totalExpenses!=0? ele.totalExpenses / maxTotalExpense:0,
                )
            ],
          )),
          Row(
              children: buckets
                  .map((e) => Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(iconsCategory[e.category],
                        color:isDarkMode?Theme.of(context).colorScheme.primary: Theme.of(context).colorScheme.primary.withOpacity(0.7)),
                      )))
                  .toList())
        ],
      ),
    );
  }
}
