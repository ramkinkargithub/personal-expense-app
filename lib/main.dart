// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpenseApp',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 40,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              headline5: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent),
            ),
        fontFamily: 'Quicksand',
        accentColor: Colors.deepOrange,
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _updateTransactionList(String txTitle, double txAmount) {
    Transaction txNew = Transaction(
        id: DateTime.now().toString(),
        tittle: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(txNew);
    });
    Navigator.of(context).pop();
  }

  void _startAddingTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_updateTransactionList),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                _startAddingTransaction(context);
              }),
              icon: Icon(Icons.add))
        ],
        title: Text(
          "He who buys what he does not need steals from himself",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                  elevation: 10,
                  child: Text(
                    "Chart !",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
            ),
            TransactionList(_userTransactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddingTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
