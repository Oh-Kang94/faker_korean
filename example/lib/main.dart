import 'package:faker_korean/faker_korean.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakerK Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name;
  String? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name ?? "No Data"),
            ElevatedButton(
              onPressed: () {
                name = FakerK().names.fullName;
                setState(() {});
              },
              child: const Text("Make FamilyName"),
            ),
            Text(address ?? "No Data"),
            ElevatedButton(
              onPressed: () {
                address = FakerK().address.fullAddress;
                setState(() {});
              },
              child: const Text("Make FullAddress"),
            ),
          ],
        ),
      ),
    );
  }
}
