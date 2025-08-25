import 'package:flutter/material.dart';

class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
        backgroundColor: Colors.white,
        // elevation: 16,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),

      backgroundColor: Color(0xFFEEEEEE),

      // body: Center(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           const SizedBox(height: 50,),
      //           const Icon(Icons.alarm),
      //           const Icon(Icons.ac_unit_outlined),
      //           const Icon(Icons.person),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text("Text 1............"),
      //           Text("Text 1............"),
      //           Text("Text 1............"),
      //         ],
      //       )
      //     ],
      //   ),
      // ),



      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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