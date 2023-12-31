import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../screen/movies_screen/movies_screen.dart';

class MainState extends Equatable {
  MainState({this.currentIndex = 0});

  final int currentIndex;
  final List<Widget> screens = [
    const MoviesScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  List<Object> get props => [
    currentIndex,
    screens,
  ];
}
