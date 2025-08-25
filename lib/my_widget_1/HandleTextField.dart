import 'package:flutter/material.dart';

class HandleTextField extends StatefulWidget {
  const HandleTextField({super.key});

  @override
  State<StatefulWidget> createState() => _HandleTextFieldState();
}

class _HandleTextFieldState extends State<HandleTextField> {
  final _textController = TextEditingController();
  String _inputText = '';
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("First App"),
          backgroundColor: Colors.white
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),

              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Enter information",
                  hintText: "Your information",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  )
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),

              SizedBox(height: 50,),

              Text(
                "You enter $_inputText"
              ),

              SizedBox(height: 50,),
              
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                ),
                obscureText: _isPasswordVisible ? false : true,
                obscuringCharacter: "•",
              )
            ],
          ),
        ),
      ),
    );
  }
}