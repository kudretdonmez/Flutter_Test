import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IOT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference _database;
  String databasejson = '';
  double temp = 20.0;
  double hum = 50.0;

  Future<void> _readdb(DataSnapshot dataSnapshot) async {
    setState(() {
      databasejson = dataSnapshot.value.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance.ref();
    _readdb;
    _tempChange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildText('Temperature is: $temp'),
            buildText('Humidity is: $hum'),
          ],
        ),
      ),
    );
  }

  Text buildText(String s) {
    return Text(
      s,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _tempChange() {
    _database.child("bme280").onValue.listen((DatabaseEvent event) {
      final data = Map<double, double>.from(event.snapshot.value! as Map<Object?, Object?>);
      setState(() {
        temp = data['Temperature'] as double;
        hum = data['Humidity'] as double;
      });
    });
  }
}
