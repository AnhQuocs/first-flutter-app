import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
        backgroundColor: Colors.white,
        // elevation: 16,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search)
          )
        ],
      ),

      backgroundColor: Color(0xFFEEEEEE),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 32,),

              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Enter your username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 32,),

              TextField(
                decoration: InputDecoration(
                  labelText: "Phone number",
                  hintText: "0XXX-XXX-XXX",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon: Icon(Icons.call),
                ),
                keyboardType: TextInputType.number,
              ),

              // SizedBox(height: 32,),

              // TextField(
              //   decoration: InputDecoration(
              //     labelText: "Birthday",
              //     hintText: "dd/MM/yyyy",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8)
              //     ),
              //     prefixIcon: Icon(Icons.date_range),
              //   ),
              //   keyboardType: TextInputType.datetime,
              // ),

              SizedBox(height: 32,),

              TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    prefixIcon: Icon(Icons.email)
                ),
              ),

              SizedBox(height: 32,),

              TextField(
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility)
                ),
                obscureText: true,
                obscuringCharacter: "•",
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}