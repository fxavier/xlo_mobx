import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/components.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signUp_store.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignUpStore signUpStore = SignUpStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                  children: [
                    Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ErrorBox(message: signUpStore.error),
                      );
                    }),
                    const FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Apelido',
                          isDense: true,
                          errorText: signUpStore.nameError,
                        ),
                        onChanged: signUpStore.setName,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Ex: fulano@gmail.com',
                          isDense: true,
                          errorText: signUpStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signUpStore.setEmail,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Numero de celular',
                          isDense: true,
                          errorText: signUpStore.celularError,
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: signUpStore.setCelular,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Senha',
                          isDense: true,
                          errorText: signUpStore.pass1Error,
                        ),
                        obscureText: true,
                        onChanged: signUpStore.setPass1,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Confirma sua senha',
                          isDense: true,
                          errorText: signUpStore.pass2Error,
                        ),
                        obscureText: true,
                        onChanged: signUpStore.setPass2,
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
                              signUpStore.isFormValid && !signUpStore.loading
                                  ? signUpStore.signUp
                                  : null,
                          child: signUpStore.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text('CADASTRAR'),
                        ),
                      );
                    }),
                    const Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
