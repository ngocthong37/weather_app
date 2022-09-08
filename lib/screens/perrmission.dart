import 'package:flutter/material.dart';

class NoPerrmission extends StatelessWidget {
  const NoPerrmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Text("No permision"),
      ),
    );
  }
}
