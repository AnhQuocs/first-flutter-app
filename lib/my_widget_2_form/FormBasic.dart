import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  const FormBasicDemo({super.key});

  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  // Global key
  final _formKey = GlobalKey<FormState>();
  String? _username;

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
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Enter your username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
                onSaved: (value) {
                  _username = value;
                },
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