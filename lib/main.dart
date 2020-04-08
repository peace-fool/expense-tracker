import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  final List<Transaction> transaction = [
    Transaction(id: 't1' , title: 'Horse', amount: 20000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Home', amount: 6000, date: DateTime.now())
  ];

  var titleController = TextEditingController();
  var amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('This is my app'),),
        body: Container(
          width: double.infinity,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Container(
              child: Card(child: Text('Some Chart' , style: TextStyle(fontSize: 18 , color:Colors.white),),color: Colors.blue, ), width: double.infinity,
              ),
            Card(child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              TextField(decoration: InputDecoration(labelText: 'Title', contentPadding: EdgeInsets.symmetric(horizontal: 10), ),controller: titleController,),
              TextField(decoration: InputDecoration(labelText: 'Amount', contentPadding: EdgeInsets.symmetric(horizontal: 10),),controller: amountController,),
              FlatButton(onPressed: (){
                print(titleController.text );
              }, child: Text('Add Transaction', style: TextStyle(color: Colors.purple),))
            ],),),

              Column(children: transaction.map((tx){
                return Card(child:
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple)) ,
                      child: Text(
                      'Rs${tx.amount}'
                    , style: TextStyle(fontSize: 15 , color: Colors.purple),), margin: EdgeInsets.symmetric(horizontal: 10) ,padding: EdgeInsets.symmetric(horizontal: 10),),
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(tx.title , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                      Text(DateFormat.yMMMd().format(tx.date) , style: TextStyle(fontSize: 15 , color: Colors.grey ),)
                    ],)
                  ],)
                );
              }).toList())
          ],
           
          ),
        ),
      ),
    );
  }
}

  