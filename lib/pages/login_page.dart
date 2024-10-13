import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                LoginForm()
              ],
            ),
          )
        )
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        Fields(type: "email"),
        Fields(type: "password"),
        LoginButton(),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        onPressed: () => {},
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green[100])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text("Login", style: TextStyle(fontSize: 22),),
        )
      ),
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {

    var hint = "";
    Icon icon;
    switch (type) {
      case "email":
        icon = Icon(Icons.person, size: 40,);
        hint += "e.g. johndoe@gmail.com";
      case "password":
        icon = Icon(Icons.key, size: 40,);
        hint += "enter your password";
      default:
        throw UnimplementedError('no widget for $type');
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: icon,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                hintText: hint,
              ),
            ),
          ),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}