import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/router/router.dart';
import 'package:ehealthapp/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  children: [
                    Text(
                      'Sua localização atual:',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Aracaju - SE',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Voce Caiu?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              )),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                  'Aperte o botão abaixo e chamaremos ajuda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Botao para definir rota!
                  AutoRouter.of(context).push(const HomeRoute());
                },
                child: Center(
                  child: Image.asset(
                    'assets/images/button_sos.png',
                    height: 250,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 55),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.colorTextField),
                child: const Column(
                  children: [
                    Text(
                      'Endereco Atual',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Rua 14, Atalaia',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
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
