import 'package:expenses_app/Widgets/new_transactions.dart';
import 'package:flutter/material.dart';
import './Widgets/Transactions_list.dart';
import './models/transactions.dart';
import './Widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontSize: 18 , fontFamily: 'OpenSans' , fontWeight: FontWeight.bold)),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'OpenSans' , fontWeight: FontWeight.bold , fontSize: 16))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Home', amount: 2000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Games', amount: 100 , date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 200, date: DateTime.now()),
    Transaction(id: 't1', title: 'Home', amount: 800, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't1', title: 'Home', amount: 440, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: 't1', title: 'Home', amount: 700, date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(id: 't1', title: 'Home', amount: 200, date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(id: 't1', title: 'Home', amount: 4000, date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(id: 't1', title: 'Home', amount: 1000, date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(id: 't1', title: 'Home', amount: 300, date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(id: 't1', title: 'Home', amount: 200, date: DateTime.now().subtract(Duration(days: 2)))
  ];

  List<Transaction> get _recentTrx {
    return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
            
                 Chart(_recentTrx),
                 
              TransactionList(_userTransactions),
              ],
              ),
         ),
         floatingActionButton: FloatingActionButton(onPressed: () => startNewAddTransaction(context), child: Icon(Icons.add)),
          );
    
  }
}

  