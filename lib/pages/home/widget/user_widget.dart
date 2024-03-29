import 'package:ehealthapp/util/colors.dart';
import 'package:ehealthapp/widget/button.dart';
import 'package:ehealthapp/widget/text_filed_custom.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
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
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Image.asset(
                  'assets/images/update_user.png',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 22.0, right: 22, bottom: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Nome Completo',
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
                  label: 'E-mail',
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
                  label: 'Senha',
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
                  label: 'Confirmar Senha',
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
                  label: 'Contato de Emergencia',
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
                  label: 'Data de Nascimento',
                  textEditingController: dateController,
                  focus: dateNode,
                  onFieldSubmit: (_) {},
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Button(
                    height: 52, text: 'Salvar', fontSize: 16, onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
