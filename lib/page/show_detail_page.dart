import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_movieapp/model/header.dart';
import 'package:flutter_training_movieapp/page_provider/show_detail_provider.dart';
import 'package:flutter_training_movieapp/providers/base_view.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowDetaiPage extends StatefulWidget {
  Show _show;
  ShowDetaiPage(this._show);
  @override
  State<StatefulWidget> createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends BaseView<ShowDetaiPage, ShowDetailProvider> {
  @override
  Widget body() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phim'),
        actions: [Icon(Icons.share), Icon(Icons.menu)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    child: YoutubePlayer(controller: provider.controller),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget._show.name}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(
                          height: 30.0,
                          width: 70.0,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(10)),
                          child: FlatButton(
                            onPressed: () {
                              provider.show = widget._show;
                              this.provider.pushBookingPage();
                            },
                            child: Text(
                              'Đặt vé',
                              style:
                                  TextStyle(fontSize: 8.0, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://www.logo-designer.co/wp-content/uploads/2019/12/2019-4DX-ScreenX-New-Logo-Designs.png'))),
                        ),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://pmcvariety.files.wordpress.com/2014/07/imax-logo.jpg?w=1000'))),
                        ),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/3D_Systems_Logo.png/1200px-3D_Systems_Logo.png'))),
                        ),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://static.mservice.io/placebrand/s/momo-upload-api-190709165424-636982880641515855.jpg'))),
                        ),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://doanhnhanplus.vn/wp-content/uploads/2020/03/D-icon.png'))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: _build(widget._show),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buidGioiThieu('Kiểm duyệt: ',
                            'C13 không dành cho khách dưới 13 tuổi.'),
                        _buidGioiThieu(
                            'Khởi chiếu: ', '${widget._show.premiered}'),
                        _buidGioiThieu('Thể loại: ', '${widget._show.type}'),
                        _buidGioiThieu(
                            'Đạo diễn: ', '${widget._show.genres[0]}'),
                        _buidGioiThieu('Diễn viên: ', '${widget._show.lLinks}'),
                        _buidGioiThieu(
                            'Thời lượng: ', '${widget._show.runtime}'),
                        _buidGioiThieu(
                            'Ngôn ngữ: ', '${widget._show.language}'),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget _buidGioiThieu(String name, String noidung) {
    return RichText(
      text: TextSpan(
          text: name,
          style: TextStyle(
              color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: noidung,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.normal))
          ]),
    );
  }

  Widget _build(Show show) {
    //var a = parse(show.summary);
    // Container(
    //   padding: EdgeInsets.all(10),
    //   child: Text(
    //     '${a.outerHtml}',
    //     maxLines: 5,
    //     overflow: TextOverflow.ellipsis,
    //   ),
    // );
    return RichText(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: '${show.summary}',
          style: TextStyle(color: Colors.black45, fontSize: 16),
          children: [
            TextSpan(
                text: 'Xem thêm',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ]),
    );
  }

  @override
  ShowDetailProvider initProvider() {
    ShowDetailProvider provider = ShowDetailProvider(this);
    provider.controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(provider.URL),
        flags: YoutubePlayerFlags(autoPlay: false, mute: true, isLive: true));
    return provider;
  }
}
