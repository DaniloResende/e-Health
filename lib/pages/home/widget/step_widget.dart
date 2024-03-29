import 'package:ehealthapp/widget/list_custom.dart';
import 'package:flutter/material.dart';

class StepWidget extends StatefulWidget {
  const StepWidget({super.key});

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {

  var values = [
    'N',
    'Status',
    'Tipo',

  ];

  var values2 = [
    '1',
    'Verdadeiro',
    'Queda para tras',

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            Center(
              child: Image.asset('assets/images/step_widget.png',),
            ),
            Center(
              child: Image.asset('assets/images/tile_step.png',),
            ),
            const SizedBox(height: 50,),
        
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return ListCustom(value: values,value2: values2,);
              },
            )
        
          ],
        ),
      ),
    );
  }

}
