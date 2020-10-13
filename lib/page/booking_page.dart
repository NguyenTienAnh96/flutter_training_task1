import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training_movieapp/dialog/dialog_booking.dart';
import 'package:flutter_training_movieapp/model/header.dart';
import 'package:flutter_training_movieapp/model/seat.dart';
import 'package:flutter_training_movieapp/page_provider/booking_page_provider.dart';
import 'package:flutter_training_movieapp/providers/base_view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BookingPage extends StatefulWidget {
  Show _show;
  BookingPage(this._show);
  @override
  State<StatefulWidget> createState() => _BookingPageState();
}

class _BookingPageState extends BaseView<BookingPage, BookingPageProvider> {
  bool isSelect = false;

  Widget _buildItem(Color color, String text, bool isSelected, Function fnc) {
    return InkWell(
      onTap: fnc,
      child: Container(
        margin: EdgeInsets.all(1),
        height: 20,
        width: 20,
        color: isSelected ? Colors.black12 : color,
        child: Center(
            child: Text(
          isSelected ? "X" : text,
          style: TextStyle(fontSize: 8),
        )),
      ),
    );
  }

  Widget _buildItemGT(Color color, String text) {
    return Container(
      padding: EdgeInsets.all(1),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget body() {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        height: 50.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '${widget._show.name}',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    '${widget._show.runtime} min, ngay: ${widget._show.premiered}'),
              ],
            ),
            ButtonTheme(
              buttonColor: Colors.red,
              height: 30.0,
              minWidth: 60.0,
              child: RaisedButton(
                onPressed: () {
                  DialogBooking.showBookingDialog(
                      context, 'Danh sách ghế đã đặt', provider.listSeat);
                },
                child: Text(
                  'Đặt vé',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('${widget._show.name}'),
        actions: [Icon(Icons.menu)],
      ),
      body: Container(
        color: Colors.black54,
        alignment: Alignment.center,
        child: Column(
          children: [
            Consumer2<SeatsNotifer, Checked>(
              builder: (context, seats, __, _) {
                int rows = (seats.value.length / provider.columns).round();
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      rows,
                      (row) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(provider.columns, (index) {
                              Seat seat =
                                  seats.value[row * provider.columns + index];
                              return _buildItem(
                                  seat.row == "A" ||
                                          seat.row == "B" ||
                                          seat.row == "C" ||
                                          seat.row == "D"
                                      ? Colors.grey
                                      : Colors.pink[100],
                                  seat.name,
                                  seat.isSelected,
                                  () => provider.checkSelect(
                                      row * provider.columns + index));
                            }));
                      },
                    ));
              },
            ),
            _buildBody()
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Container(
      color: Colors.white12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemGT(Colors.black12, ' Đã đặt'),
                  _buildItemGT(Colors.red, ' Đang chọn'),
                  _buildItemGT(Colors.green[100], ' 4DX'),
                  _buildItemGT(Colors.yellow, ' Khác'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemGT(Colors.grey, ' Thường'),
                  _buildItemGT(Colors.pink[200], ' Vip'),
                  _buildItemGT(Colors.brown, ' Lamour'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemGT(Colors.purple, ' Ghế đôi'),
                  _buildItemGT(Colors.blue, ' Deluxe'),
                  _buildItemGT(Colors.blue[100], ' Premium'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemGT(Colors.green, ' Khuyết tật'),
                  _buildItemGT(Colors.pink, ' Sweet Box'),
                  _buildItemGT(Colors.yellowAccent[100], ' Gold class'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  BookingPageProvider initProvider() {
    BookingPageProvider provider = BookingPageProvider(this);
    return provider;
  }
}
