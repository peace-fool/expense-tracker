import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Chart1 extends StatelessWidget{
  
  final List<double> weekdata;
  Chart1(this.weekdata);
  @override
  Widget build(BuildContext context) {
    
    return  
    Container(
      width: 393,
      child: Card(
        elevation: 5,
        child: 
        Column(
          children: <Widget>[
            Container(child: Text('This Week Chart' , style: TextStyle(fontWeight: FontWeight.bold),), margin: EdgeInsets.all(10),),
            Container(
              margin: EdgeInsets.only(right: 20 , left: 20 , bottom:20) , 
              child: new Sparkline(
                data: weekdata,
                lineColor: Colors.orange,
                pointsMode: PointsMode.all,
                pointColor: Colors.blue,
              ), 
            ),
          ],
        ),
      ),
    );
  }

}