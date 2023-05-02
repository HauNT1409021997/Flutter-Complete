import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatefulWidget {
  // List<Transaction>? executedTransaction = [];
  // TransactionList({executedTransaction});
  @override
  State<StatefulWidget> createState() {
    return MyTransactionList();
  }
}

class MyTransactionList extends State<TransactionList> {
  // void init() {
  //   for (var i = 0; i < 9; i++) {
  //     executedTransaction!.add(Transaction(
  //         id: i.toString(),
  //         title: "${i}-transaction",
  //         amount: (i + 1) * 1000,
  //         date: DateTime.now()));
  //   }
  // }
  List<Transaction>? displayList = [];
  // MyTransactionList({this.displayList});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init();
    // displayList = widget.executedTransaction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: displayList!.length == 0
          ? Column(
              children: [
                Text('No data found'),
                SizedBox(
                  height: 20,
                ),
                Image.asset('assets/image/waiting.png', fit: BoxFit.cover)
              ].toList(),
            ) //show image
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Text(
                            "${displayList![index].amount.toString()}\$",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(248, 119, 110, 110))),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: Text(
                              DateFormat('yyyy年MM月dd日')
                                  .format(displayList![index].date ??
                                      DateTime.now())
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: Color.fromARGB(207, 9, 7, 86)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(displayList![index].title ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(254, 107, 16, 168))),
                          ),
                        ],
                      )
                    ].toList(),
                  ),
                );
              },
              itemCount: displayList!.length,
            ),
    );
  }
}
