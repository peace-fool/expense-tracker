import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final List<Transaction> transaction;
  TransactionList(this.transaction);
    
  @override
  Widget build(BuildContext context){
    return  Card(
      elevation: 5,
     child: 
     Container(
      height: 485,
      child: transaction.isEmpty ? Column(children: <Widget>[
        Text('No transaction is added yet!' , style: Theme.of(context).textTheme.title,),
        SizedBox(height: 20),
        Container(height: 200,
          child: Image.asset('lib/Images/waiting.png' , fit: BoxFit.cover,))
      ],)
       :ListView.builder(
        itemBuilder: (ctx , index){
          return ListTile(
            leading: Container(child: FittedBox(child: CircleAvatar(radius: 30 , child: Text('Rs${transaction[index].amount}'),), ), margin: EdgeInsets.all(6),),
            title: Text(transaction[index].title ,style: Theme.of(context).textTheme.title,),
            subtitle: Text(DateFormat.yMMMd().format(transaction[index].date)),
          );
        },
        itemCount: transaction.length,
      ),
    ),);
  }
}





