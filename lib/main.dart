import 'package:expenses_app/Widgets/new_transactions.dart';
import 'package:flutter/material.dart';
import './Widgets/Transactions_list.dart';
import './models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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

  void startNewAddTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(newTx),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

 

  @override
  Widget build(BuildContext context){
    return  Scaffold(
        appBar: AppBar(title: Text('This is my app'),
         actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => startNewAddTransaction(context),)
        ],
        
        ),
       
         body: Container(
              width: double.infinity,
           child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Container(
                  child: Card(child: Text('Some Chart' , style: TextStyle(fontSize: 20 , color:Colors.black54),),color: Theme.of(context).accentColor, ), 
                  width: double.infinity,
                  ),  
              TransactionList(_userTransactions),
              ],
              ),
         ),
         floatingActionButton: FloatingActionButton(onPressed: () => startNewAddTransaction(context), child: Icon(Icons.add)),
          );
    
  }
}

  