import 'package:e_health/home/bloc/counter_bloc.dart';
import 'package:e_health/home/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Contador: ${state.value}');
              },
            ),
            ElevatedButton(onPressed: () {}, child: Text('Incrementar')),
            ElevatedButton(onPressed: () {}, child: Text('Decrementar')),
          ],
        ));
  }
}
