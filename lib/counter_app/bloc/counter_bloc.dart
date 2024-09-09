import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count=0;
  CounterBloc() : super(CounterInitial(0)) {
    int count=0;
    on<CounterEvent>((event, emit) {
      if(event is IncrementEvent){
        count++;
        emit(CounterIncremented(count));
      }
      if(event is DecrementEvent){
        count--;
        emit(CounterIncremented(count));
      }
    });
  }
}
