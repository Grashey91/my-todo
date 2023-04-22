import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.deepPurple[200],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),

            // Task Name
            Text(taskName,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
          ],
        ),
      ),
    );
  }
}
