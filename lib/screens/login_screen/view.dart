import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.keyboard_backspace_rounded,
                color: Color.fromRGBO(62, 74, 89, 0.45),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                ),
                height: 36,
                child: Text(
                  'Welecome back!',
                  style: TextStyle(
                    color: Color(0xff3e4a59),
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: ListTile(
                  //     title: Container(
                  //       height: 18,
                  //       child: Text(
                  //         'Remember me',
                  //         style: TextStyle(
                  //           color: Color.fromRGBO(62, 74, 89, 0.45),
                  //           fontSize: 12,
                  //         ),
                  //       ),
                  //     ),
                  //     leading: Radio(
                  //       value: true,
                  //       groupValue: true,
                  //       onChanged: null,
                  //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 18,
                    child: Text(
                      'Remember me',
                      style: TextStyle(
                        color: Color.fromRGBO(62, 74, 89, 0.45),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(),
                    height: 18,
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Color(0xff3ad29f),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    color: Color(0xff3ad29f),
                    disabledColor: Color(0xff3ad29f),
                    textColor: Colors.white,
                    disabledTextColor: Colors.white,
                    onPressed: null,
                    child: Text('Button'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 14,
                    child: Text(
                      'New user? ',
                      style: TextStyle(
                        color: Color.fromRGBO(62, 74, 89, 0.45),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    height: 14,
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        color: Color(0xff3ad29f),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
