import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

part 'signUp_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? celular;

  @observable
  String? pass1;

  @observable
  String? pass2;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setCelular(String celular) => this.celular = celular;

  @action
  void setPass1(String pass1) => this.pass1 = pass1;

  @action
  void setPass2(String pass2) => this.pass2 = pass2;

  @computed
  String? get nameError {
    int len = 0;
    String? msg;
    if (name != null) {
      len = name!.length;
      if (name == null || len >= 3) {
        msg = null;
      } else if (name!.isEmpty) {
        msg = 'O nome obrigatorio';
      } else {
        msg = 'Nome muito curto';
      }
    }
    return msg;
  }

  @computed
  bool get nameValid {
    int len = 0;
    if (name != null) {
      len = name!.length;
    }
    return len >= 3;
  }

  @computed
  String? get emailError {
    String? message;
    if (email != null) {
      if (email == null || email!.isEmailValid()) {
        message = null;
      } else if (email!.isEmpty) {
        message = 'Email obrigatorio';
      } else {
        message = 'E-mail invalido';
      }
    }

    return message;
  }

  @computed
  bool get emailValid {
    bool isValid = false;
    if (email != null) {
      isValid = email!.isEmailValid();
    }
    return (email == null || isValid);
  }

  @computed
  String? get celularError {
    int len = 0;
    String? message;
    if (celular != null) {
      len = celular!.length;
      if (celular == null || len == 9) {
        message = null;
      } else if (celular!.isEmpty) {
        message = 'Celular obrigatorio';
      } else {
        message = 'Numero invalido';
      }
    }

    return message;
  }

  @computed
  bool get celularValid {
    int len = 0;
    if (celular != null) {
      len = celular!.length;
    }
    return (celular == null || len == 9);
  }

  @computed
  String? get pass1Error {
    int len = 0;
    String? message;
    if (pass1 != null) {
      len = pass1!.length;
      if (pass1 == null || len >= 6) {
        message = null;
      } else if (pass1!.isEmpty) {
        message = 'A Password e obrigatoria';
      } else {
        message = 'Senha invalida';
      }
    }

    return message;
  }

  @computed
  bool get pass1Valid {
    int len = 0;
    if (pass1 != null) {
      len = pass1!.length;
    }
    return len >= 6;
  }

  @computed
  bool get pass2Valid {
    int len = 0;
    if (pass2 != null) {
      len = pass2!.length;
    }

    return (pass2 == null || len > 6 && pass1 == pass2);
  }

  @computed
  String? get pass2Error {
    int len = 0;
    String? message;
    if (pass2 != null) {
      len = pass2!.length;
      if (pass2 == null || len > 6 && pass1 == pass2) {
        message = null;
      } else if (pass2!.isEmpty) {
        message = 'A Senha e obrigatoria';
      } else {
        message = 'Senhas não coincidem';
      }
    }

    return message;
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && celularValid && pass1Valid && pass2Valid;

  @computed
  Future<void>? get signUpPressed =>
      (isFormValid && !loading) ? signUp() : null;

  @action
  Future<void> signUp() async {
    loading = true;
    // await Future.delayed(const Duration(seconds: 3));
    final user =
        User(name: name, email: email, phone: celular, password: pass1);

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = e as String?;
    }
    loading = false;
  }
}
