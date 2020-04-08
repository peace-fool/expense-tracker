import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final List<Transaction> transaction;
  TransactionList(this.transaction);
    
  @override
  Widget build(BuildContext context){
    return  Container(
      height:460,
      child: SingleChildScrollView(
      child: Column(children: transaction.map((tx){
                  return Card(child:
                    Row(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.purple), color: Colors.purple) ,
                        child: Text(
                        'Rs${tx.amount}'
                      , style: TextStyle(fontSize: 15 , color: Colors.white),), margin: EdgeInsets.symmetric(horizontal: 10) ,padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),),
                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text(tx.title , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                        Text(DateFormat.yMMMd().format(tx.date) , style: TextStyle(fontSize: 15 , color: Colors.grey ),)
                      ],)
                    ],)
                  );
                }).toList())),
    );
  }
}