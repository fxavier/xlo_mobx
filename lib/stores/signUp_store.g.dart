// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_SignUpStore.nameError'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??=
          Computed<bool>(() => super.nameValid, name: '_SignUpStore.nameValid'))
      .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_SignUpStore.emailError'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpStore.emailValid'))
          .value;
  Computed<String?>? _$celularErrorComputed;

  @override
  String? get celularError =>
      (_$celularErrorComputed ??= Computed<String?>(() => super.celularError,
              name: '_SignUpStore.celularError'))
          .value;
  Computed<bool>? _$celularValidComputed;

  @override
  bool get celularValid =>
      (_$celularValidComputed ??= Computed<bool>(() => super.celularValid,
              name: '_SignUpStore.celularValid'))
          .value;
  Computed<String?>? _$pass1ErrorComputed;

  @override
  String? get pass1Error =>
      (_$pass1ErrorComputed ??= Computed<String?>(() => super.pass1Error,
              name: '_SignUpStore.pass1Error'))
          .value;
  Computed<bool>? _$pass1ValidComputed;

  @override
  bool get pass1Valid =>
      (_$pass1ValidComputed ??= Computed<bool>(() => super.pass1Valid,
              name: '_SignUpStore.pass1Valid'))
          .value;
  Computed<bool>? _$pass2ValidComputed;

  @override
  bool get pass2Valid =>
      (_$pass2ValidComputed ??= Computed<bool>(() => super.pass2Valid,
              name: '_SignUpStore.pass2Valid'))
          .value;
  Computed<String?>? _$pass2ErrorComputed;

  @override
  String? get pass2Error =>
      (_$pass2ErrorComputed ??= Computed<String?>(() => super.pass2Error,
              name: '_SignUpStore.pass2Error'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStore.isFormValid'))
          .value;
  Computed<Future<void>?>? _$signUpPressedComputed;

  @override
  Future<void>? get signUpPressed => (_$signUpPressedComputed ??=
          Computed<Future<void>?>(() => super.signUpPressed,
              name: '_SignUpStore.signUpPressed'))
      .value;

  late final _$nameAtom = Atom(name: '_SignUpStore.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_SignUpStore.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$celularAtom =
      Atom(name: '_SignUpStore.celular', context: context);

  @override
  String? get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String? value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  late final _$pass1Atom = Atom(name: '_SignUpStore.pass1', context: context);

  @override
  String? get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String? value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  late final _$pass2Atom = Atom(name: '_SignUpStore.pass2', context: context);

  @override
  String? get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String? value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignUpStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_SignUpStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpStore.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignUpStoreActionController =
      ActionController(name: '_SignUpStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String celular) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setCelular');
    try {
      return super.setCelular(celular);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass1(String pass1) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPass1');
    try {
      return super.setPass1(pass1);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass2(String pass2) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPass2');
    try {
      return super.setPass2(pass2);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
celular: ${celular},
pass1: ${pass1},
pass2: ${pass2},
loading: ${loading},
error: ${error},
nameError: ${nameError},
nameValid: ${nameValid},
emailError: ${emailError},
emailValid: ${emailValid},
celularError: ${celularError},
celularValid: ${celularValid},
pass1Error: ${pass1Error},
pass1Valid: ${pass1Valid},
pass2Valid: ${pass2Valid},
pass2Error: ${pass2Error},
isFormValid: ${isFormValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
