import 'package:flutter/material.dart';


class TestPage extends StatefulWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Checkbox(
        value: this.value,
        onChanged: (bool? value) {
          setState(() {
            this.value = value!;
          });
        },
      ),
    );
  }
}
