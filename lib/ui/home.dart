import 'package:flutter/material.dart';
import '../widget/tab_box.dart';
import '../ui/login.dart';
import '../model/user.dart';

import 'package:flutter/services.dart' show rootBundle;

class Home extends StatelessWidget {
  User _sser;
  Home(this_user);
  @override
  Widget build(BuildContext context) {
    Color color = Colors.blueAccent.shade700;
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
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Text(
                                'Kandalsteg Switzerland',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      //FavoriteWidgetStateFull
                      FavoriteWidgetState(),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildButtonColumn(color, Icons.call, 'CALL'),
                        _buildButtonColumn(color, Icons.near_me, 'ROUT'),
                        _buildButtonColumn(color, Icons.share, 'SHARE'),
                      ],
                    )),
                Container(
                  child: _textSection,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: TabBox(),
                  ),
                ),
                Container(
                  child: Center(
                    child: IconButton(icon: Icon(Icons.lock_outline), onPressed:
                        ()=>{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> Login())
                    )
                    }),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _textSection = Container(
    padding: const EdgeInsets.all(16.0),
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
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }

}

class FavoriteWidgetState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidgetState> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0, right: 16.0),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              onPressed: _toggleFavorite,
              color: Colors.red[500],
            ),
          ),
          SizedBox(
              width: 18.0,
              child: Text(
                '$_favoriteCount',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.redAccent.shade400),
              ))
        ],
      ),
    );
  }
}

