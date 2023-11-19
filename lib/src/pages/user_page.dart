import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mahdi_khodabakhshi/src/pages/register_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UserPage extends StatefulWidget {
  //final String email;
  //final String password;
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER PAGE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _inputEmail(),
            _inputPassword(),
            ElevatedButton(
              onPressed: () => _mostrarAlerta(context),
              child: Text('Login'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              
              child: Text('Registrar'),
              onPressed: () => _registro(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'Escribir tu correo',
            label: Text('Email'),
            icon: Icon(Icons.email)),
        controller: _emailController,
      ),
    );
  }

  Widget _inputPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Escribe tu contraseña',
          //label: Text('Password'),
          icon: Icon(Icons.password),
        ),
        controller: _passController,
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('error al iniciar sesion'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('email o contraseña incorrecto'),
                Icon(
                  Icons.cancel,
                  size: 100,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Aceptar'))
            ],
          );
        });
  }

  void _registro(BuildContext context) {
    showCupertinoModalBottomSheet(
     expand: true, 
     context: context,
     builder: (context) => RegisterPage(),
     
     ).then((value) {

       _emailController.text = value['email'] ?? '';
       _passController.text = value['pass'] ?? '';
     }
     
     );
  }
}
