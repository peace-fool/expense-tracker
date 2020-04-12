import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget{

  final Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit (){
    final enteredtitle = titleController.text;
    final enteredamount = int.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredamount <1){
      return;
    }
    widget.newTx(enteredtitle ,enteredamount);
    Navigator.of(context).pop();
  }
  

  @override
  Widget build(BuildContext context){
    return Card(child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title',
                contentPadding: EdgeInsets.symmetric(horizontal: 10), ),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submit(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount',
                contentPadding: EdgeInsets.symmetric(horizontal: 10),),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submit(),
                ),
              FlatButton(onPressed:submit, child: Text('Add Transaction', style: TextStyle(color: Theme.of(context).primaryColor),))
            ],
            ),
            );
  }
}