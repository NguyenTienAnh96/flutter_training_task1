import 'package:flutter/material.dart';
import 'package:flutter_training_movieapp/model/seat.dart';
import 'package:flutter_training_movieapp/providers/base_notifier.dart';
import 'package:flutter_training_movieapp/providers/base_provider.dart';
import 'package:provider/provider.dart';

class BookingPageProvider extends BaseProvider {
  Checked _isCheck = Checked(false);
  int _columns = 16;
  int get columns => _columns;
  List<Seat> listSeat = List<Seat>();

  BookingPageProvider(State<StatefulWidget> state) : super(state) {
    List<Seat> list = [];
    ["A", "B", "C", "D", "E", "F", "G", "H", "J", "S"].forEach((row) {
      list.addAll(List.generate(columns, (index) {
        return Seat.Normal(row, (1 + index).toString());
      }));
    });
    _seats.value = list;
  }

  SeatsNotifer _seats = SeatsNotifer();

  void checkSelect(int index) {
    _seats.value[index].isSelected = !_seats.value[index].isSelected;
    _isCheck.value = !_isCheck.value;
    if (_seats.value[index].isSelected) {
      listSeat.add(_seats.value[index]);
    } else {
      listSeat.remove(_seats.value[index]);
    }

    print('select ${_isCheck.value}');
    print('list $listSeat');
  }

  @override
  List<BaseNotifier> initNotifiers() => [_isCheck, _seats];
}

class Checked extends BaseNotifier<bool> {
  Checked(bool value) : super(value);

  @override
  ListenableProvider<Listenable> provider() => ChangeNotifierProvider<Checked>(
        create: (context) => this,
      );
}

class SeatsNotifer extends BaseNotifier<List<Seat>> {
  SeatsNotifer() : super([]);

  @override
  ListenableProvider<Listenable> provider() =>
      ChangeNotifierProvider<SeatsNotifer>(
        create: (context) => this,
      );
}
