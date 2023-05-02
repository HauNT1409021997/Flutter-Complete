import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  Function? addTransaction;
  NewTransactionForm({this.addTransaction});
  @override
  State<StatefulWidget> createState() {
    return _NewTransactionForm();
  }
}

class _NewTransactionForm extends State<NewTransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate = null;
  void addData(String text, String amount) {
    widget.addTransaction!(text, amount);
    Navigator.of(context).pop();
  }

  void showDatePickerhandler() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.red, width: 2)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              // onChanged: (String value) => {
              //   transactionTitle = value
              // }, //get value of input element by listening to every keystrokes
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  label: Text('Transaction Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
            ),
            TextField(
              controller: amountController,
              // onChanged: (String value) => {
              //   transactionAmount = value
              // }, //get value of input element by listening to every keystrokes
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text(
                'Amount',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
            ),
            Row(
              children: [
                Text(selectedDate != null
                    ? DateFormat.yMd().format(selectedDate!)
                    : 'Datepicker'),
                IconButton(
                    onPressed: showDatePickerhandler,
                    icon: Icon(Icons.date_range_rounded))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: FloatingActionButton(
                onPressed: () =>
                    addData(titleController.text, amountController.text),
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
