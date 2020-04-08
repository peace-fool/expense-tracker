import 'package:flutter/material.dart';
import './Widgets/user_transactions.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  

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
          UserTransaction()
          ],
          ),
        ),
      ),
    );
  }
}

  