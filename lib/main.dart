import 'package:equatable_example/phone.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final Phone samsung = const Phone(
      phoneName: 'Samsung S20 FE 5G', phoneImage: 'assets/phone1.jpeg');
  final Phone iphone =
      const Phone(phoneName: 'Iphone 11', phoneImage: 'assets/phone2.jpeg');
  final Phone iphone2 =
      const Phone(phoneName: 'Iphone 11', phoneImage: 'assets/phone2.jpeg');

  comparePhone(BuildContext context) {
    if (iphone == iphone2) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("YES, They are EQUAL")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("NO, They are not EQUAL")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Equatable Example')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            phoneWidget(
                phoneName: iphone.phoneName, phoneImage: iphone.phoneImage),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                comparePhone(context);
              },
              child: const Text("Compare"),
            ),
            phoneWidget(
              phoneImage: iphone2.phoneImage,
              phoneName: iphone2.phoneName,
            ),
          ],
        ),
      ),
    );
  }

  phoneWidget({
    required phoneImage,
    required phoneName,
  }) {
    return Column(
      children: [
        Image.asset(phoneImage),
        const SizedBox(height: 5),
        Text(
          phoneName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
