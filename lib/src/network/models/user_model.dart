import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  final String? email, name, photo;
  final String id;

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  factory User.fromJson(Map<dynamic, dynamic> userJson) {
    try {
      User user = User(
        id: userJson["id"],
        email: userJson["email"],
        photo: userJson["photo"],
        name: userJson["name"],
      );

      return user;
    } catch (e) {
      print('Error while creating user from json');
      return User.empty;
    }
  }

  @override
  String toString() {
    return 'User ( id: $id, email: $email, name: $name, photo: $photo)';
  }

  @override
  List<Object?> get props => [id, email, name, photo];
}

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp(r'[A-Za-z\d]{8,}$');
  //RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}

/// Validation errors for the [ConfirmedPassword] [FormzInput].
enum ConfirmedPasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template confirmed_password}
/// Form input for a confirmed password input.
/// {@endtemplate}
class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  /// {@macro confirmed_password}
  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');

  /// {@macro confirmed_password}
  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  /// The original password.
  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}
