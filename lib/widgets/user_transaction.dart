import 'dart:ffi';
import 'dart:math';
import '../model/transaction.dart';
import 'package:flutter/material.dart';
import './new_transaction_form.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyUserTransaction();
  }
}

class MyUserTransaction extends State<UserTransaction> {
  List<Transaction> updatedTransaction = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(244, 228, 223, 223),
          width: double.infinity, // double.infinity === width: 100%; in css
          height: 30, //fullwidth 100%,
          child: const Card(
            color: Color.fromARGB(
                244, 143, 137, 137), // color of the text on the card
            elevation: 5, // box-shadow ypx xpx
            child: Text('Chart'),
          ),
        ),
        TransactionList(),
      ],
    );
  }
}
