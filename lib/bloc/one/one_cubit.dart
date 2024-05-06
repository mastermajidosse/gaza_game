import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'one_state.dart';

class OneCubit extends Cubit<OneState> {
  OneCubit() : super(OneInitial());
}
