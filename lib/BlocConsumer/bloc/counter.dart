import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends Cubit<int> {
  Counter({this.init = 0}) : super(init);

  int init;
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
