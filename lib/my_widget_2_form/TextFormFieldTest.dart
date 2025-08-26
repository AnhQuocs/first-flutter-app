import 'package:flutter/material.dart';

class TextFormFieldTest extends StatefulWidget {
  const TextFormFieldTest({super.key});

  @override
  State<StatefulWidget> createState() => _TextFormFieldDemoState();
}

class _TextFormFieldDemoState extends State<TextFormFieldTest> {
  // Global key
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _username;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Form"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person)
                ),
                onSaved: (value) {
                  _username = value;
                },
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24,),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if(!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24,),

              TextFormField(
                controller: _passwordController,
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
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if(value.length < 8) {
                    return "The password must be at least 8 characters long";
                  }
                  return null;
                },
                obscureText: _isPasswordVisible ? false : true,
                obscuringCharacter: "•",
              ),

              SizedBox(height: 24,),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Hello $_username"))
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)
                        )
                    ),
                    child: Text("Submit"),
                  ),

                  SizedBox(width: 24,),

                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _username = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)
                        )
                    ),
                    child: Text("Reset"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}