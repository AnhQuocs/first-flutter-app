import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),

            ElevatedButton(
                onPressed: () {},
                child: Text("Button"),
            ),

            SizedBox(height: 50,),

            TextButton(
                onPressed: () {},
                child: Text("Click here")
            ),

            SizedBox(height: 50,),

            OutlinedButton(
                onPressed: () {},
                child: Text("Click here")
            )
          ],
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