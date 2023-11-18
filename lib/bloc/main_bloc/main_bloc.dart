import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<ChangeCurrentIndexEvent>(_changeCurrentIndex);
  }

  static MainBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _changeCurrentIndex(
      ChangeCurrentIndexEvent event, Emitter<MainState> emit) {
    emit(
      MainState(
        currentIndex: event.currentIndex,
      ),
    );
  }
}
