import 'package:flutter/material.dart';

class Chart2 extends StatelessWidget{

  final List<Map<String,Object>> recentTra;
  final double totalSpending;
  Chart2({
    this.recentTra,
    this.totalSpending
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Container(child: Text('Extra Chart', style: TextStyle(fontWeight: FontWeight.bold)), margin: EdgeInsets.all(10),),
            //SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: 
                 recentTra.map((data){
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(label: data['day'],
                    spendingAnount: data['amount'],
                    percentageAmount: totalSpending == 0 ? 0
                    :(data['amount'] as double)/totalSpending ),
                  );
                }).toList()
              ,),
            ),
          ],
        )
      ),
    );
  }
}

class ChartBar extends StatelessWidget{
  final String label;
  final double spendingAnount;
  final double percentageAmount;

  ChartBar({
    this.label,
    this.spendingAnount,
    this.percentageAmount
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FittedBox(child: Text('Rs${spendingAnount.toStringAsFixed(0)}')),
      SizedBox(height: 4),
      Container(
        height: 60,
        width: 10,
        child: Stack(children: <Widget>[
          Container(decoration: BoxDecoration(
            border: Border.all(color: Colors.grey , width: 1.0),
            color: Color.fromRGBO(220, 220, 220, 1),
            borderRadius: BorderRadius.circular(20)
          ),),
          FractionallySizedBox(heightFactor: percentageAmount,
          child: Container(decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20)
          ),),
          )
        ],),
      ),
      SizedBox(height: 4,),
      Text(label)
    ],);
  }

}