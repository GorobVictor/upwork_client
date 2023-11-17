import 'package:flutter/material.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/features/home_page/home_page_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: SizedBox(
          height: size.height * 0.3,
          width: size.width * 0.7,
          child: Column(
            children: [
              LoginTextForm(
                controller: login,
                name: 'Login',
              ),
              LoginTextForm(
                controller: password,
                name: 'Password',
              ),
              ElevatedButton(
                onPressed: () async {
                  final token = await AccountRepository()
                      .login(LoginDto(login.text, password.text));

                  if (token != null) {
                    await LocalRepository().saveToken(token);
                    await Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomePageWidget(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextForm extends StatelessWidget {
  const LoginTextForm({
    required this.controller,
    required this.name,
    super.key,
  });

  final TextEditingController controller;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: name,
        ),
      ),
    );
  }
}
