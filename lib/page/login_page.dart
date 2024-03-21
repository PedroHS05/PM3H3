import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loading = false;

  final emailController = TextEditingController(text: "");
  final senhaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 600,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: senhaController,
                  decoration: const InputDecoration(
                    hintText: "senha",
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Builder(
                  builder: (context) {
                    if (loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ElevatedButton(
                      onPressed: () {
                        login().then(
                          (value) {
                            setState(() {
                              loading = false;
                            });

                            return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text("Entrar"),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Esqueci minha senha",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  Text(
                    "Criar Conta",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> login() async {
    setState(() {
      loading = true;
    });

    return Future.delayed(
      const Duration(milliseconds: 100),
      () async {
        var message = "";

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: senhaController.text,
          );

          message =
              "Seja bem vindo, ${credential.user?.displayName ?? "Usuário"}";
        } on FirebaseAuthException catch (e) {
          message = 'não foi possível completar o login';
        }

        return message;
      },
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
