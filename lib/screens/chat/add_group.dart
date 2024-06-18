import 'package:flutter/material.dart';
import 'package:lawyer/screens/widgets/black18text.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Black18text(text: "Add Group"),
      ),
    );
  }
}
