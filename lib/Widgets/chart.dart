import 'package:intl/intl.dart';

import '../models/transactions.dart';
import 'package:flutter/material.dart';
import './Chart1.dart';
import './Chart2.dart';

class Chart extends StatelessWidget{
  final List<Transaction> recentTra;
  Chart(this.recentTra);

  List<Map<String,Object>> get weekelyTransaction {
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double dailyamount  = 0;
      for (int i =0; i < recentTra.length ; i++){
        if (recentTra[i].date.day == weekDay.day && recentTra[i].date.year == weekDay.year && recentTra[i].date.month == weekDay.month){
          dailyamount += recentTra[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay).substring(0,2), 'amount': dailyamount };
    }).reversed.toList();
  }
  List<double> get weekdata {
    return weekelyTransaction.map((data){
      return double.parse(data['amount'].toString());
  }).toList();
  }

  double get totalSpending{
    return weekelyTransaction.fold(0.0, (sum , item){
      return  sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Chart1(weekdata),
          Chart2(recentTra: weekelyTransaction ,totalSpending: totalSpending,),
        ],
      ),
    );
  }
}