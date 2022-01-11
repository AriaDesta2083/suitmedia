import 'package:flutter/material.dart';

const String nameNull = "Name Can't be empty";
const String palindromeNull = "Palindrome Can't be empty";

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(
          Icons.error,
          size: 16,
          color: Colors.white,
        ),
        Text(
          ' ' + error,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

bool checkpallindrom(List<int> chars) {
  for (int i = chars.length - 1, j = 0; i >= chars.length ~/ 2; i--, j++) {
    if (chars[i] != chars[j]) return false;
  }
  return true;
}
