import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String? email;
  @observable
  String? password;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  @action
  Future<void> login() async {
    loading = true;
    try {
      final user = await UserRepository().loginWithEmail(email!, password!);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      error = e as String?;
      print('Error $e');
    }
    loading = false;
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
  String? get passwordError {
    int len = 0;
    String? message;
    if (password != null) {
      len = password!.length;
      if (password == null || len >= 6) {
        message = null;
      } else if (password!.isEmpty) {
        message = 'A Senha e obrigatoria';
      } else {
        message = 'Senha invalida';
      }
    }

    return message;
  }

  @computed
  bool get passwordValid {
    int len = 0;
    if (password != null) {
      len = password!.length;
    }
    return len >= 6;
  }

  @computed
  bool get isFormValid => emailValid && passwordValid;
}
