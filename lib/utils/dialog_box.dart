import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            // Task Input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
              style: const TextStyle(color: Colors.white),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Save Button
                children: [
                  MyButton(
                    text: "Save",
                    onPressed: onSave,
                  ),
                  MyButton(
                    text: "Cancel",
                    onPressed: onCancel,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
