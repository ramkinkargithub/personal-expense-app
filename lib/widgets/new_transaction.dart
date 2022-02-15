import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function updateTransaction;
  NewTransaction(this.updateTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (amount <= 0 || title.isEmpty) return;
    updateTransaction(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              elevation: 5,
              child: TextField(
                onSubmitted: (_) => addTransaction(),
                decoration: InputDecoration.collapsed(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 18),
                ),
                controller: titleController,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              elevation: 5,
              child: TextField(
                onSubmitted: (_) => addTransaction(),
                decoration: InputDecoration.collapsed(
                  hintText: 'Amount',
                  hintStyle: TextStyle(fontSize: 18),
                ),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
            ),
            Card(
              elevation: 5,
              child: FlatButton(
                onPressed: addTransaction,
                child: Text(
                  "Add Transaction",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
