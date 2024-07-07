import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Medic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              AppBar(
                  leading: Image(image: AssetImage('assets/1.png')),
                  title: Text(
                    'PORTAL MED',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  backgroundColor: Colors.white),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 80),
                  Image(
                    image: AssetImage('assets/2.png'),
                    alignment: Alignment.center,
                    width: 200,
                  ),
                  SizedBox(height: 40),
                  const Text(
                    'LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  const Text(
                    'Insira suas credenciais para acessar sua conta',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 104, 104, 104)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite seu email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite sua senha';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(89, 120, 229, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5), // Define o border radius
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // Perform login action
                          print('Email: $_email, Password: $_password');
                        }
                      },
                      child:
                          Text('ENTRAR', style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
