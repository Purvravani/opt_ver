import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,

      );
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home-opt-var"),
      ),
      body: Column(children: [
        TextField(controller: t1,),
        TextField(controller: t2,),
        ElevatedButton(onPressed: () {
          String name=t1.text;
          String contact=t2.text;
          users
              .add({
            'name': name, // John Doe
            'contact': contact, // Stokes and Sons
            // 'age': age // 42
          })
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error"));
        }, child: Text("add data"))
      ],),
    );
  }
}
