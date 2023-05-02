import 'package:flutter/material.dart';
// import './widgets/transaction_list.dart';
import './widgets/new_transaction_form.dart';
// import './widgets/user_transaction.dart';
import './model/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MaterialApp(
      // theme is a global css settings in a flutter app
      theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.white,
          fontFamily: 'OpenSans-Bold',
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans', fontSize: 100, color: Colors.red))),
      home:
          MyApp())); //solution for Widget test fails with No MediaQuery widget found
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();
  // String transactionTitle = "";
  // String transactionAmount = "";
  List<Transaction> updatedTransaction = [];
  void createNewTransaction(String title, String amount) {
    var transaction = Transaction(
        id: (updatedTransaction.length + 1).toString(),
        title: title,
        date: DateTime.now(),
        amount: double.parse(amount));
    setState(() {
      updatedTransaction.add(transaction);
    });
  }

  void showNewTransaction(BuildContext context) {
    //show bottom modal,
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransactionForm(
              addTransaction: createNewTransaction,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: const Text('Flutter widget course'),
          actions: [
            IconButton(
                onPressed: () => showNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // adjust the vertial poisition of the element wrapped in the Column widget
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // adust the horizontal position of the element wrapped in the Column widget
            children: [
              TransactionList(),
            ]),
      ),
    );
  }
}
