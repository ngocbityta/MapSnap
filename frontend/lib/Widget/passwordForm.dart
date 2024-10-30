import 'package:flutter/material.dart';

class passwordForm extends StatefulWidget {
  const passwordForm({
    super.key,
    required this.label,
  });
    
  final String label;
  
  @override
  State<passwordForm> createState() => _passwordFormState();
}

class _passwordFormState extends State<passwordForm> {
  bool passwordVisible = true;

  @override
  void initState(){
    super.initState();
    passwordVisible = true;
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passwordVisible,
      decoration: new InputDecoration(
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  width: 2.0
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  width: 3.0,
                  color: Colors.lightBlueAccent
              )
          ),
          suffixIcon: TextButton.icon(

            label: Text(''),
            icon: (!passwordVisible ? Image.asset("assets/Login/visibility.png") : Image.asset("assets/Login/visibility_off.png")),
            onPressed: () {
              setState(
                    () {
                  passwordVisible = !passwordVisible;
                },
              );
            },
          )
      ),
    );
  }
}

