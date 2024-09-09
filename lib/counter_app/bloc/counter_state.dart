part of 'counter_bloc.dart';

abstract class CounterState {
  int count;
  CounterState(this.count);
}

class CounterInitial extends CounterState {
   CounterInitial(super.count);
}
 class CounterIncremented extends CounterState {
  CounterIncremented(super.count);
 }

 class CounterDecremented extends CounterState {
  CounterDecremented(super.count);
 }
