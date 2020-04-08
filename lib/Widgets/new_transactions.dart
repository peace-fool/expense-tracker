import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget{

  final Function newTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.newTx);
  
  @override
  Widget build(BuildContext context){
    return Card(child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              TextField(decoration: InputDecoration(labelText: 'Title', contentPadding: EdgeInsets.symmetric(horizontal: 10), ),controller: titleController,),
              TextField(decoration: InputDecoration(labelText: 'Amount', contentPadding: EdgeInsets.symmetric(horizontal: 10),),controller: amountController,),
              FlatButton(onPressed: () {newTx(titleController.text ,int.parse(amountController.text) ); }, child: Text('Add Transaction', style: TextStyle(color: Colors.purple),))
            ],
            ),
            );
  }
}