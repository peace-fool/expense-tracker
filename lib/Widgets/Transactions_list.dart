import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final List<Transaction> transaction;
  TransactionList(this.transaction);
    
  @override
  Widget build(BuildContext context){
    return   Container(
      height: 620,
      child: ListView.builder(
        itemBuilder: (ctx , index){
            return Card(
              child:
                Row(
                  children: <Widget>[
                        Container(
                          decoration: BoxDecoration( color: Theme.of(context).primaryColor) ,
                          child: Text(
                          'Rs${transaction[index].amount}'
                        , style: TextStyle(fontSize: 15 , color: Colors.white),), margin: EdgeInsets.symmetric(horizontal: 10) ,padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),),
                        Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text(transaction[index].title , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                          Text(DateFormat.yMMMd().format(transaction[index].date) , style: TextStyle(fontSize: 15 , color: Colors.grey ),)
                        ],
                        )
                  ],
                )
              );
        },
        itemCount: transaction.length,
      ),
    );
  }
}