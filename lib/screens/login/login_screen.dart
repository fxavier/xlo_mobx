import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/components.dart';
import 'package:xlo_mobx/screens/screens.dart';
import 'package:xlo_mobx/stores/login_store.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Acessar com E-mail:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                      ),
                    ),
                    Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ErrorBox(
                          message: loginStore.error,
                        ),
                      );
                    }),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            child: const Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.passwordError,
                        ),
                        obscureText: true,
                        onChanged: loginStore.setPassword,
                      );
                    }),
                    Observer(builder: (_) {
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            disabledBackgroundColor:
                                Colors.orange.withAlpha(120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed:
                              loginStore.isFormValid && !loginStore.loading
                                  ? loginStore.login
                                  : null,
                          child: loginStore.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text('ENTRAR'),
                        ),
                      );
                    }),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Não tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SignupScreen()));
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
