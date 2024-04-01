import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/router/router.dart';
import 'package:ehealthapp/util/colors.dart';
import 'package:ehealthapp/widget/button.dart';
import 'package:ehealthapp/widget/text_filed_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  FocusNode nameNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController passController = TextEditingController();
  FocusNode passNode = FocusNode();
  TextEditingController confirmPassController = TextEditingController();
  FocusNode confirmPassNode = FocusNode();
  TextEditingController contactController = TextEditingController();
  FocusNode contactNode = FocusNode();
  TextEditingController dateController = TextEditingController();
  FocusNode dateNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 18.0, left: 18),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 143,
                  height: 146,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Criar conta',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
              const Padding(
                padding:
                    EdgeInsets.only(left: 32.0, right: 32, top: 18, bottom: 18),
                child: Center(
                    child: Text(
                  'Bem vindo ao e-Health, digite seus dados abaixo para efetuar o registro.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Nome Completo*',
                  textEditingController: nameController,
                  focus: nameNode,
                  onFieldSubmit: (_) {
                    emailNode.requestFocus();
                  },
                  obscureText: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'E-mail*',
                  textEditingController: emailController,
                  focus: emailNode,
                  onFieldSubmit: (_) {
                    passNode.requestFocus();
                  },
                  obscureText: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Senha*',
                  textEditingController: passController,
                  focus: confirmPassNode,
                  onFieldSubmit: (_) {
                    confirmPassNode.requestFocus();
                  },
                  obscureText: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Confirmar Senha*',
                  textEditingController: confirmPassController,
                  focus: confirmPassNode,
                  onFieldSubmit: (_) {
                    contactNode.requestFocus();
                  },
                  obscureText: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Contato de Emergencia*',
                  textEditingController: contactController,
                  focus: contactNode,
                  onFieldSubmit: (_) {
                    dateNode.requestFocus();
                  },
                  obscureText: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Data de Nascimento*',
                  textEditingController: dateController,
                  focus: dateNode,
                  onFieldSubmit: (_) {},
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Button(
                    height: 52,
                    text: 'Continuar',
                    fontSize: 16,
                    onTap: () {
                      AutoRouter.of(context).replace(const HomeRoute());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
