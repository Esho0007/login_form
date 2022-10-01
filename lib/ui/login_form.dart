import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString= " ";

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }
  void _showWelcome(){
    setState(() {
      if(_passwordController.text.isNotEmpty
      && _userController.text.isNotEmpty){
        _welcomeString = _userController.text;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Login')),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,

      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Image.asset('images/head.JPG',
              height: 90.0,
                width: 90.0,

                //color: Colors.lightGreenAccent,

              ),
              Container(
                height: 200.0,
                width: 480.0,
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        icon: Icon(Icons.person)
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          icon: Icon(Icons.lock)
                      ),
                      obscureText: true,
                    ),

                    Padding(padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30.0,20.0,0.0,0.0),
                              child: ElevatedButton(
                                onPressed:_showWelcome,
                                child:  const Text("Login", style: TextStyle(color: Colors.white,
                                      fontSize: 19.9,
                                      fontWeight: FontWeight.bold,
                                    )),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(130.0,20.0,0.0,0.0),
                              child: ElevatedButton(
                                onPressed: _erase,
                                child:  const Text("Clear", style: TextStyle(color: Colors.white,
                                  fontSize: 19.9,
                                  fontWeight: FontWeight.bold,
                                )),

                              ),
                            ),
                          ],

                ),
                        ),
                      ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(29.0),
                    child: Text("Welcome, $_welcomeString",
                    style: const TextStyle(color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}