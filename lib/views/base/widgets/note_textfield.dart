import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    required TextEditingController noteTEController,
  }) : _noteTEController = noteTEController;

  final TextEditingController _noteTEController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:_noteTEController ,
      minLines: 5,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Add a note here',

        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}