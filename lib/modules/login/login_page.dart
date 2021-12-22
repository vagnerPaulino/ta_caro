import 'package:flutter/material.dart';

import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button/button.dart';
import 'package:meuapp/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 200,
              ),
              InputText(
                label: "E-mail",
                hint: "Digite seu e-mail",
                validator: (value) =>
                    isEmail(value) ? null : "Digite um e-mail válido",
                onChanged: (value) => controller.onChange(email: value),
              ),
              SizedBox(
                height: 18,
              ),
              InputText(
                label: "Senha",
                obscure: true,
                hint: "Digite sua senha",
                validator: (value) =>
                    value.length >= 6 ? null : "Digite uma senha mais forte",
                onChanged: (value) => controller.onChange(password: value),
              ),
              SizedBox(
                height: 14,
              ),
              Button(
                label: "Entrar",
                onTap: () {
                  controller.login();
                },
              ),
              SizedBox(
                height: 50,
              ),
              Button(
                label: "Criar conta",
                type: ButtonType.outline,
                onTap: () {
                  Navigator.pushNamed(context, "/login/create-account");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
