// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:randomqoutegeneraterapp/utils/generateqoute.dart';
import 'randomQoute_Event.dart';
import 'randomQoute_State.dart';

class RandomqouteBloc extends Bloc<RandomqouteEvent, RandomqouteState> {
  RandomqouteBloc() : super(const RandomqouteState()) {
    on<GenerateQoute>(qouteGenerated);
  }
  void qouteGenerated(
      RandomqouteEvent event, Emitter<RandomqouteState> emit) async {
    String qoute = await generateQoute();
    emit(state.copyWith(qoute: qoute));
  }
}
