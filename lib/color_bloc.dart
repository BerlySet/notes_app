import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_light_blue }
// enum ini untuk membuat jenis jenis ColorEvent

class ColorBloc {
  Color _color = Colors.amber;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink =>
      _eventController.sink; //get sink dari stream controller 1

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink =>
      _stateController.sink; //get sink dari stream controller 2
  Stream<Color> get stateStream =>
      _stateController.stream; //get stream dari stream controller 2

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_amber) {
      _color = Colors.amber;
    } else {
      _color = Colors.lightBlue;
    }

    _stateSink
        .add(_color); //menghubungkan hasil dari fungsi ini ke sink controller 2
  }

  ColorBloc() {
    _eventController.stream.listen((_mapEventToState) {});
    // menghubungkan stream dari controller 1 ke fungsi mapEventToState
  }

// menghapus stream controller ketika telah selelsai, agar memory free
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}