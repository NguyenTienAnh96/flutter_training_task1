import 'package:flutter/material.dart';
import 'package:flutter_training_movieapp/model/seat.dart';
import 'package:flutter_training_movieapp/page/home_page.dart';

class DialogBooking {
  static void showBookingDialog(
      BuildContext context, String title, List<Seat> seat) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: Container(
                    width: double.maxFinite,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: seat.length,
                        itemBuilder: (context, int index) {
                          return Text('${seat[index].row}${seat[index].col}');
                        })),
              ),
              actions: [
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop(DialogBooking);
                  },
                ),
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                )
              ],
            ));
  }
}
