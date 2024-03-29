import 'package:ehealthapp/util/colors.dart';
import 'package:ehealthapp/widget/list_custom.dart';
import 'package:flutter/material.dart';

class CallWidget extends StatefulWidget {
  const CallWidget({super.key});

  @override
  State<CallWidget> createState() => _CallWidgetState();
}

class _CallWidgetState extends State<CallWidget> {

  var values = [
    'Pai',
    'Mae',
    'Tio',
    'Carlos',
    'Roberto',
  ];
  var title = [
    'Nomes',
    'N de Telefone',

  ];
  var values2 = [
    '(41) 99999-9999',
    '(41) 99999-9999',
    '(41) 99999-9999',
    '(41) 99999-9999',
    '(41) 99999-9999',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80,),
          Center(
            child: Image.asset('assets/images/logo_call.png',),
          ),
          const SizedBox(height: 50,),
          ListCustom(value: values,value2: values2,title: title,)

        ],
      ),
    );
  }

}
