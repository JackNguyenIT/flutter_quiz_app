import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:quiz_app/resource/localization/l10n.dart';

enum EmailValidationError {
  empty,
  invalid;

  String getMessage(BuildContext context) {
    switch (this) {
      case EmailValidationError.empty:
        return "";
      case EmailValidationError.invalid:
        return AppTranslations.of(context).email_invalid;
    }
  }
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([String value = '']) : super.pure(value);

  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    final data = value?.trim();
    if (data == null || data.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_emailRegExp.hasMatch(data)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

enum TextRequiredValidationError {
  empty;

  String getMessage(BuildContext context) {
    switch (this) {
      case TextRequiredValidationError.empty:
        return "";
    }
  }
}

class TextRequired extends FormzInput<String, TextRequiredValidationError> {
  const TextRequired.pure([String value = '']) : super.pure(value);

  const TextRequired.dirty([String value = '']) : super.dirty(value);

  @override
  TextRequiredValidationError? validator(String? value) {
    return value?.trim().isNotEmpty == true
        ? null
        : TextRequiredValidationError.empty;
  }
}

class EmailForm with FormzMixin {
  EmailForm({
    this.email = const Email.pure(),
  });

  final Email email;

  EmailForm copyWith({
    Email? email,
  }) {
    email = email ?? this.email;

    return EmailForm(email: email);
  }

  @override
  List<FormzInput> get inputs => [email];
}

class UpdateUserForm with FormzMixin {
  UpdateUserForm({
    this.name = const TextRequired.pure(),
    this.email = const Email.pure(),
  });

  final TextRequired name;
  final Email email;

  UpdateUserForm copyWith({
    TextRequired? name,
    Email? email,
  }) {
    email = email ?? this.email;
    name = name ?? this.name;

    return UpdateUserForm(name: name, email: email);
  }

  @override
  List<FormzInput> get inputs => [name, email];
}
