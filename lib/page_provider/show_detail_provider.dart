import 'package:flutter/material.dart';
import 'package:flutter_training_movieapp/model/header.dart';
import 'package:flutter_training_movieapp/page/booking_page.dart';
import 'package:flutter_training_movieapp/providers/base_notifier.dart';
import 'package:flutter_training_movieapp/providers/base_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowDetailProvider extends BaseProvider {
  String URL = 'https://www.youtube.com/watch?v=XRm1P7oGpMQ';
  YoutubePlayerController controller;
  bool isCheck = false;
  Show show;
  ShowDetailProvider(State<StatefulWidget> state) : super(state);

  void pushBookingPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BookingPage(show)));
  }

  @override
  List<BaseNotifier> initNotifiers() => [];
}
