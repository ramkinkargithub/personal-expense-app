// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    (Transaction(
      id: "69",
      tittle: "Chocolate",
      amount: 140,
      date: DateTime.now(),
    )),
    (Transaction(
        id: "722022",
        tittle: "Chicken Fried Rice",
        amount: 70,
        date: DateTime.now())),
    (Transaction(
        id: "96",
        tittle: "Blenders Pride Half",
        amount: 450,
        date: DateTime.now())),
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      title: 'Expense',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "He who buys what he does not need steals from himself",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                  color: Colors.purpleAccent,
                  shadowColor: Colors.deepPurple,
                  elevation: 10,
                  child: Text(
                    "Chart !",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
            ),
            Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration.collapsed(hintText: 'Title'),
                    ),
                    Card(
                      elevation: 50,
                    ),
                    TextField(
                      decoration: InputDecoration.collapsed(hintText: 'Amount'),
                    ),
                    FlatButton(onPressed: null, child: Text("Add Transaction")),
                  ],
                ),
              ),
            ),
            ...transactions.map((element) {
              return Card(
                elevation: 40,
                shadowColor: Colors.blueAccent,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 150,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 5)),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '₹ ${element.amount.toString()}',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          element.tittle,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(element.date),
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
