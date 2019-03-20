import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('on trip'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'images/sea.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                     Expanded(
                         child: Padding(padding: EdgeInsets.only(top: 32.0,left: 16.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(
                               'Oeschinen Lake Campground',
                               style: TextStyle(
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,),
                             ),
                             Padding(padding: EdgeInsets.only(top: 6.0),
                             child: Text(
                               'Kandalsteg Switzerland',
                               textAlign: TextAlign.left,
                               style: TextStyle(
                                 fontSize:14.0,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.grey,),
                             ),)
                           ],
                         ),)
                     )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
