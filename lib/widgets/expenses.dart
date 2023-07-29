import 'package:budget_tracker/models/expense.dart';
import 'package:budget_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:budget_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Bochu jutsu',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.education),
    Expense(
      title: 'Cinema',
      amount: 200,
      date: DateTime.now(),
      category: Category.entertainment,
    )
  ];

  void _openAddExpensiveOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpensiveOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            'Expenses List',
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          )
        ],
      ),
    );
  }
}
