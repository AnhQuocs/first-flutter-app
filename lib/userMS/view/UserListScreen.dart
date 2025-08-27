import 'package:first_flutter_app/userMS/db/UserDatabaseHelper.dart';
import 'package:first_flutter_app/userMS/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final dbHelper = UserDatabaseHelper.instance;

  // để refresh list sau khi thêm
  late Future<List<User>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = dbHelper.getAllUsers();
  }

  void _refreshUsers() {
    setState(() {
      usersFuture = dbHelper.getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User list"),),
      body: FutureBuilder<List<User>>(
        future: dbHelper.getAllUsers(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // loading
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if(!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No users yet!"));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: user.avatar != null
                      ? NetworkImage(user.avatar!)
                      : null,
                  child: user.avatar == null ? Icon(Icons.person) : null,
                ),
                title: Text(user.name),
                subtitle: Text("${user.email}\n${user.phone}"),
                isThreeLine: true,
                onTap: () {},
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newUser = await showDialog<User>(
              context: context,
              builder: (_) => AddUserDialog(),
          );

          if(newUser != null) {
            await dbHelper.createUser(newUser);
            _refreshUsers();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddUserDialog extends StatefulWidget{
  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new User"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _nameCtrl, decoration: InputDecoration(labelText: "Name")),
          TextField(controller: _emailCtrl, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: _phoneCtrl, decoration: InputDecoration(labelText: "Phone number")),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final user = User(
                name: _nameCtrl.text,
                email: _emailCtrl.text,
                phone: _phoneCtrl.text,
                avatar: null,
                dateOfBirth: DateTime.now(),
            );
            Navigator .pop(context, user);
          },
          child: Text("Add"),
        )
      ],
    );
  }
}