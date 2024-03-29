import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/router/router.dart';
import 'package:ehealthapp/util/colors.dart';
import 'package:ehealthapp/widget/button.dart';
import 'package:ehealthapp/widget/text_filed_custom.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController passController = TextEditingController();
  FocusNode passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),

              Center(
                child: Image.asset('assets/images/logo.png',width: 143,height: 146,),
              ),
              const SizedBox(height: 20,),
              const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                  )
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                      'Bem vindo ao e-Health, digite seus dados abaixo para continuar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'E-mail',
                  textEditingController: emailController,
                  focus: emailNode,
                  onFieldSubmit: (_) {
                    passNode.requestFocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: TextFieldCustom(
                  colorText: Colors.black,
                  label: 'Senha',
                  textEditingController: passController,
                  focus: passNode,
                  onFieldSubmit: (_) {},
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('Esqueceu a senha?', style: TextStyle(fontWeight: FontWeight.w600,color: primaryColor,fontSize: 14),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0,bottom: 8),
                child: Button(
                    height: 52,
                    text: 'Continuar',
                    fontSize: 16,
                    onTap: () {
                      AutoRouter.of(context).replace(const WelcomeRoute());
                    }),
              ),
              GestureDetector(
                onTap: (){
                  AutoRouter.of(context).push(const RegisterRoute());
                },
                child: const Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não possui uma conta? ', style: TextStyle(fontSize:14,fontWeight: FontWeight.w400,),),
                    Text(' Registre-se', style: TextStyle(fontWeight: FontWeight.w600,color: primaryColor,fontSize: 14,),)
                  ],
                ),
              )
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
