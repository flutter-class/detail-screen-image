import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/user.dart';
import '../ui/register.dart';
import '../ui/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginState();

}

class LoginState extends State<Login>{

  TextEditingController _userNameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  static var defaultUser =  User('admin','admin');

  void _onLogin(){
    setState(() {
      var user = User(_userNameController.value.text,_passwordController.value.text);
      print('${user.name} , ${user.password}');
    });
  }

  static const _boxColors = <Color>[
    Color(0xFFc6a700),
    Color(0xFFfdd835),
  ];

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _boxColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.0)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,color: Colors.white,size: 100.0,),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(padding: const EdgeInsets.only(right: 32.0,top: 32.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height/2,
              padding: EdgeInsets.only(top: 69.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _customTextField(_userNameController,hint:"email",icon:Icons.email,obscureText: false),
                  _customTextField(_passwordController,hint: 'password',icon: Icons.vpn_key,obscureText: true),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/8),
                      child: InkWell(
                        onTap: ()=> debugPrint('forgot password'),
                        child: Container(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Forgot password?'),
                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: _customButton('Login',(){

                  var user=User(_userNameController.value.text,_passwordController.value.text);
                  if(user.name==defaultUser.name && user.password==defaultUser.password)
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(user)));
                  else
                    Fluttertoast.showToast(msg: 'wrong user passowrd.',);
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Don\'t have an account?'),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 4,right: 12,top: 12 , bottom: 12),
                    child: Text('Register',style:  TextStyle(color: Color(0xFFc6a700)),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _customTextField(TextEditingController controller,{String hint,IconData icon,bool obscureText}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 5
          )
        ]
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey,),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
      width: MediaQuery.of(context).size.width/1.2,
      //height: 50.0,
      margin:  EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.only(
        top: 4,right: 16,left: 16,bottom: 4
      ),
    );
  }

  Widget _customButton(String label,GestureTapCallback callback){
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width/1.2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _boxColors
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0))
        ),
        child: Center(
          child: Text(label.toUpperCase(),
            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400,color: Colors.white),),
        ),
      ),
    );
  }



}