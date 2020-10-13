import 'package:flutter/foundation.dart';

enum SeatType { Booked, Normal }

class Seat {
  final String col;
  final String row;
  final SeatType type;
  bool isSelected = false;

  Seat({@required this.row, @required this.col, @required this.type});

  String get name => row + col;

  factory Seat.Booked(String row, String col) {
    return Seat(type: SeatType.Booked, row: row, col: col);
  }
  factory Seat.Normal(String row, String col) {
    return Seat(type: SeatType.Normal, row: row, col: col);
  }
}
