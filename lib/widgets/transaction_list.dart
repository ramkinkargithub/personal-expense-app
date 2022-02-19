import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'No transactions added yet.',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 20,
                shadowColor: Colors.red,
                child: Container(
                  height: 200,
                  width: 450,
                  child: Image.asset(
                    'assets/images/gif2.gif',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text('Add transaction here',
                  style: Theme.of(context).textTheme.headline4),
              Container(
                height: 40,
                child: Image.asset(
                  'assets/images/image2.jpg',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : Container(
            height: 400,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 40,
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 200,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 5,
                          color: Theme.of(context).primaryColor,
                        )),
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '₹ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].tittle,
                              style: Theme.of(context).textTheme.headline4),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
          );
  }
}
