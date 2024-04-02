import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/features/fall_detector/data/datasources/acelerometer_sensor.dart';
import 'package:ehealthapp/router/router.dart';
import 'package:ehealthapp/util/colors.dart';
import 'package:ehealthapp/widget/button.dart';
import 'package:ehealthapp/widget/graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _controller = ValueNotifier<bool>(false);
  bool _checked = false;
  final sensorDataProvider = SensorDataProvider();
  @override
  void initState() {
    super.initState();
    _loadCheckedState();
    

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          _checked = true;
        } else {
          _checked = false;
        }
        _saveCheckedState();
      });
    });
  }
  _loadCheckedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _checked = prefs.getBool('checked') ?? false;
      _controller.value = _checked;
    });
  }

  _saveCheckedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checked', _checked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 92,
              height: 83,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Button(
                    height: 52,
                    text: 'Help',
                    fontSize: 16,
                    onTap: () {
                      AutoRouter.of(context).push(const HelpRoute());
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Button(
                    height: 52,
                    text: 'Dialog',
                    fontSize: 16,
                    onTap: () {
                      dialogCustom();
                    }),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Detector de Quedas',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AdvancedSwitch(
                controller: _controller,
              ),
            ),
          ),
          // *********
          Visibility(
            visible: _checked,
            child: Center(
              child: LineChartSample2(
                sensorDataProvider: sensorDataProvider,
              ),
            ),
          ),
          // *********
        ],
      ),
    );
  }

  dialogCustom() {
    Dialog dialog = Dialog(
      backgroundColor: AppColors.colorDialog,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        height: 330,
        width: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Center(
                child: Image.asset('assets/images/siren.png'),
              ),
            ),
            const Text(
              "1:00",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Ao não pressionar nenhum botão por 1 minuto, os seus contatos de emergência serão contatados!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            Button(
                height: 52,
                color: AppColors.colorDialogButton,
                text: 'Queda Confirmada',
                fontSize: 16,
                onTap: () {
                  // BOTAO PARA DISPARAR SMS
                  AutoRouter.of(context).push(const HomeRoute());
                }),
            Button(
                padding: EdgeInsets.zero,
                height: 52,
                color: Colors.transparent,
                text: 'Alarme Falso',
                fontSize: 16,
                onTap: () {
                  // BOTAO PARA VOLTAR A DETECTAR QUEDAS
                  AutoRouter.of(context).push(const HomeRoute());
                }),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
