import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './TransactionItems.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx , constraints){
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'lib/Images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
          
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transactions: transactions, deleteTx: deleteTx, index: index);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
