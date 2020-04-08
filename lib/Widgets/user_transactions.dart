import 'package:expenses_app/models/transactions.dart';
import 'package:flutter/material.dart';
import './new_transactions.dart';
import './Transactions_list.dart';

class UserTransaction extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => UserTransactionState();
}

class UserTransactionState extends State<UserTransaction>{


  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 1999 , date: DateTime.now())
    
  ];

  void newTx(String titlex , int amountx){
    final newTxt = Transaction(id: DateTime.now().toString(), title: titlex , amount: amountx, date: DateTime.now() );
    setState(() {
      _userTransactions.add(newTxt);
    });
  }
  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        NewTransaction(newTx),
        TransactionList(_userTransactions)
      ],
    );
  }
}