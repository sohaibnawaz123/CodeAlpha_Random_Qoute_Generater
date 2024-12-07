// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class RandomqouteState extends Equatable {
  final String qoute;
  const RandomqouteState({this.qoute = 'Press Button'});

  RandomqouteState copyWith({String? qoute}) {
    return RandomqouteState(qoute: qoute ?? this.qoute);
  }

  @override
  List<Object?> get props => [qoute];
}
