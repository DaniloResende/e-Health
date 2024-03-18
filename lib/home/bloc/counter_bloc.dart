import 'package:e_health/home/bloc/counter_event.dart';
import 'package:e_health/home/bloc/counter_state.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    var counter = state.value;
    if (event is CounterAdd) {
      // yield é um return que nao para a execucao!   estado assincrono
      yield CounterState(value: ++counter);
    } else if (event is CounterSub) {
      yield CounterState(value: --counter);
    }
  }
}
