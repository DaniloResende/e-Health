import 'package:auto_route/auto_route.dart';
import 'package:ehealthapp/router/router.dart';
import 'package:ehealthapp/util/colors.dart';
import 'package:ehealthapp/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
              const SizedBox(height: 80,),

              Center(
                child: Image.asset('assets/images/step.png',width: 90,height: 90,),
              ),
              const SizedBox(height: 20,),
              const Center(
                  child: Text(
                    'Detector de Quedas',
                    style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),
                  )
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 28.0,horizontal: 28),
                child: Center(
                    child: Text(
                      'A principal função do aplicativo e-Health é detectar quedas, na pior das hipóteses de algo acontecer a você!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                    )
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 28.0,horizontal: 28),
                child: Center(
                    child: Text(
                      'Para que nosso detector funcione como esperado, precisamos que voce tenha fornecido corretamente todos os seus dados.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32.0,bottom: 8),
                child: Button(
                    height: 52,
                    text: 'Continuar',
                    fontSize: 16,
                    onTap: () async{
                      await _checkLocationWhenInUseStatus(context);

                    }),
              ),



            ],
          ),
        ),
      ),
    );
  }



  static Future<void> _checkLocationWhenInUseStatus(context) async {
    var locationWhenInUsePermission = Permission.locationWhenInUse;
    var status = await locationWhenInUsePermission.status;

    if (status.isDenied) {
      status = await locationWhenInUsePermission.request();
    }
    AutoRouter.of(context).replace(const HomeRoute());
  }

    // if (status.isGranted) {
    //   await LocationAlwaysPermission.handleLocationAlwaysPermission();
    //
}
