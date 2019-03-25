import 'package:flutter/material.dart';
class TabBox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TabBoxState();
  }
}
class _TabBoxState extends State<TabBox>{
  bool _isActive=false;
  void _tabTheBox(){
    setState(() {
      if(_isActive)
        _isActive=false;
      else
        _isActive=true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: _tabTheBox,
      child: Container(
        child: Center(
          child:  Text(_isActive ? 'active':'inactive',
          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22.0,color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: (_isActive? Colors.lightGreen[700] : Colors.grey[400])
        ),
      ),
    );
  }
}