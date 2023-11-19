import 'package:flutter/material.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _globalKey,
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return Column(
      children: [
        _formItemDesing(
          Icons.person,
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: _ValidateNombre,
          ),
        ),
        _formItemDesing(
          Icons.email,
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: _ValidateEmail,
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
          ),
        ),
        _formItemDesing(
          Icons.lock,
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Contraseña'),
            validator: _validatePass,
          ),
        ),
        _formItemDesing(
          Icons.lock,
          TextFormField(
            controller: repeatPasswordController,
            obscureText: true,
            decoration: InputDecoration(labelText: ' Repite Contraseña'),
            validator: _ValidaterepPass,
          ),
        ),
        ElevatedButton(
          onPressed: () => save(),
          child: Text('Register'),
        ),
      ],
    );
  }

  save() {
    var valid = _globalKey.currentState?.validate();
    if (valid == true) {
      Map<String, String> datos = {
        'email': emailController.text,
        'pass': passwordController.text
      };
      Navigator.pop(context, datos);
    }
  }

  _formItemDesing(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: item,
        ),
      ),
    );
  }

  String? _ValidateNombre(String? value) {
    String pattern = r'(^[a-zA-Z]*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'el nombre es necesario';
    } else if (!regExp.hasMatch(value)) {
      return 'el nombre solo debe contener letra';
    }

    return null;
  }

  String? _ValidateEmail(String? value) {
    String pattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'el correo es necesario';
    } else if (!regExp.hasMatch(value)) {
      return 'el formato de email es incorrecto';
    }

    return null;
  }

  String? _ValidaterepPass(String? value) {
    if (value == null || value.isEmpty) {
      return 'repita contraseña';
    }
    else if (value != passwordController.text) {
      return 'el valor de contraseña no coincide';
    }

    return null;
  }
  
   String? _validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return 'el contraseña es necesario';
    }
    

    return null;
  }
}
