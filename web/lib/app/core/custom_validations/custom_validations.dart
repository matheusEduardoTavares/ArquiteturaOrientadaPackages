import 'package:flutter/material.dart';

class CustomValidations {
  CustomValidations._();

  static FormFieldValidator url(String errorMessage) {
    return (value) {
      if (!Uri.parse(value).isAbsolute) {
        return errorMessage;
      }

      return null;
    };
  }
}