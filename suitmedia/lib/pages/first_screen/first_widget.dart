import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/pages/second_screen/second_page.dart';
import 'package:suitmedia/services/services.dart';
import 'package:suitmedia/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController palindromeController = TextEditingController(text: "");
  String? name;
  String? palindrome;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNamaFormField(),
          SizedBox(
            height: 22,
          ),
          buildPalindromeFormField(),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 45,
          ),
          FormError(errors: errors),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                fixedSize: Size(double.maxFinite, 41),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                //! PUSH
                if (_formKey.currentState!.validate()) {
                  String palindrome = palindromeController.text;
                  List<int> chars = palindrome.runes.toList();
                  bool check = checkpallindrom(chars);
                  if (check == true) {
                    Get.defaultDialog(
                        title: 'Palindrome',
                        middleText: '${palindrome} is Palindrome');
                  } else {
                    Get.defaultDialog(
                        title: 'Palindrome',
                        middleText: '${palindrome} not Palindrome');
                  }
                }
              },
              child: Text('CHECK', style: myButtonTextStyle)),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              //! PUSH
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(nameController.text)));
              }
            },
            child: Text(
              'NEXT',
              style: myButtonTextStyle,
            ),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              fixedSize: Size(double.maxFinite, 41),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildNamaFormField() {
    return TextFormField(
      controller: nameController,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: nameNull);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: nameNull);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Name",
      ),
    );
  }

  TextFormField buildPalindromeFormField() {
    return TextFormField(
      controller: palindromeController,
      onSaved: (newValue) => palindrome = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: palindromeNull);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: palindromeNull);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Palindrome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
