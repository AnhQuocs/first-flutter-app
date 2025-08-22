import 'package:flutter/material.dart';

class MyGestures extends StatelessWidget {
  const MyGestures({super.key});

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
            GestureDetector(
              onTap: () {
                print("1 tap");
              },
              onDoubleTap: () {
                print("2 tap");
              },
              onPanUpdate: (details) {
                print("Move ${details.delta}");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: const Text("Click me"),
                ),
              ),
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