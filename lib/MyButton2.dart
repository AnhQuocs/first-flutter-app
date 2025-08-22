import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  const MyButton2({super.key});

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
                onLongPress: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                elevation: 8,
              ),
              child: Text("Button")
            ),
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