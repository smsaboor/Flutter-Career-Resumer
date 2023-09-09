import 'package:flutter/material.dart';

class FormValidation {
  String? isValidLength(String value) {
    if (value.length <= 2) {
      return 'enter_valid_information';
    }
    return null;
  }

  String? isValidFirstName(String value) {
    if (value.length <= 2) {
      return 'enter_your_first_name';
    }
    return null;
  }

  String? isValidLastName(String value) {
    if (value.length <= 2) {
      return 'enter_your_last_name';
    }
    return null;
  }

  String? isValidPassword(String value) {
    if (value.length <= 7) {
      return 'password_should_be';
    }
    return null;
  }

  String? isValidEmail(String email) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
    return null;
  }
}
