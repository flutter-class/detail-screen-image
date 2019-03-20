import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
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
                          child: Padding(
                            padding: EdgeInsets.only(top: 32.0, left: 16.0),
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
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,),
                                  ),)
                              ],
                            ),)
                      ),
                      Padding(padding: EdgeInsets.only(top: 32.0, right: 16.0),
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.star,
                                color: Colors.blueAccent.shade400,),),
                                Text('100')
                          ],
                        ),)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildButtonColumn(color, Icons.call, 'CALL'),
                        _buildButtonColumn(color, Icons.near_me, 'ROUT'),
                        _buildButtonColumn(color, Icons.share, 'SHARE'),
                      ],
                    )),
                Container(
                  child: textSection,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color
            ),
          ),
        )
      ],
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}