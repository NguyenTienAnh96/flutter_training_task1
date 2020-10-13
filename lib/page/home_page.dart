import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training_movieapp/page_provider/home_page_provider.dart';
import 'package:flutter_training_movieapp/providers/base_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends BaseView<HomePage, HomePageProvider>
    with TickerProviderStateMixin {
  @override
  Widget body() {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            bottomNavigationBar: _buildBottom(),
            body: SafeArea(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<HeaderNotifier>(builder: _buildHeader),
                          Container(
                              child: TabBar(
                                  onTap: provider.selectTab,
                                  indicatorColor: Colors.black,
                                  labelColor: Colors.black,
                                  tabs: [
                                Tab(text: 'Đang chiếu'),
                                Tab(text: "Đặc biệt"),
                                Tab(text: "Sắp chiếu")
                              ])),
                          Expanded(
                              child: TabBarView(children: [
                            Consumer<DangChieuNotifier>(
                                builder: (context, value, _) => _buildPageView(
                                        _buildPageViewDangChieu, (index) {
                                      print('index: $index');

                                      var a = value
                                          .value[index % value.value.length];
                                      this.provider.getDataShow(a.show);
                                    })),
                            Consumer<DacBietNotifier>(
                                builder: (context, value, child) =>
                                    _buildPageView(_buildPageViewDacbiet,
                                        (index) {
                                      var a = value
                                          .value[index % value.value.length];
                                      this.provider.getDataShow(a.show);
                                    })),
                            Consumer<SapChieuNotifier>(
                                builder: (context, value, _) => _buildPageView(
                                        _buildPageViewSapChieu, (index) {
                                      var a = value
                                          .value[index % value.value.length];
                                      this.provider.getDataShow(a.show);
                                    }))
                          ]))
                        ])))));
  }

  Widget _buildHeader(context, value, child) {
    return Container(
        height: 160.0,
        child: PageView.builder(
            controller: provider.ctrl, itemBuilder: _buildItemHeader));
  }

  Widget _buildItemHeader(BuildContext context, int index) {
    var data = provider.getHeaderAt(index);
    return data == null
        ? SpinKitCircle(color: Colors.black)
        : Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data?.show?.image?.original != null
                        ? '${data?.show?.image?.original}'
                        : "https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png"))));
  }

  Widget _buildPageViewDangChieu(BuildContext context, int index) {
    var dangchieu = provider.getDangChieuAt(index);
    return Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Stack(
            children: [
              SpinKitCircle(
                color: Colors.black,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: kTransparentImage,
                    image: dangchieu?.show?.image?.original != null
                        ? '${dangchieu?.show?.image?.original}'
                        : "https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png"),
              ),
            ],
          ),
        ));
  }

  Widget _buildPageViewDacbiet(BuildContext context, int index) {
    var dacbiet = provider.getDacBietAt(index);
    return Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Stack(
            children: [
              SpinKitCircle(
                color: Colors.black,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: kTransparentImage,
                    image: dacbiet?.show?.image?.original != null
                        ? '${dacbiet?.show?.image?.original}'
                        : "https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png"),
              ),
            ],
          ),
        ));
  }

  Widget _buildPageViewSapChieu(BuildContext context, int index) {
    var dacbiet = provider.getSapChieuAt(index);
    return Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Stack(
            children: [
              SpinKitCircle(
                color: Colors.black,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: kTransparentImage,
                    image: dacbiet?.show?.image?.original != null
                        ? '${dacbiet?.show?.image?.original}'
                        : "https://upload.wikimedia.org/wikipedia/commons/f/fc/No_picture_available.png"),
              ),
            ],
          ),
        ));
  }

  Widget _buildPageView(Function buildItem, Function onPageChange) {
    return Container(
      color: Colors.black,
      child: PageView.builder(
          controller: provider.pageViewController,
          itemBuilder: buildItem,
          onPageChanged: onPageChange),
    );
  }

  _buildBottom() {
    return Consumer<ShowData>(
        builder: (context, value, child) => Container(
            color: Colors.grey,
            height: 50.0,
            child: Stack(children: [
              Positioned(
                  right: 10.0,
                  bottom: 8.0,
                  child: Container(
                      height: 30.0,
                      width: 70.0,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                          onPressed: () {
                            this.provider.pushShowDetailPage();
                          },
                          child: Text(
                            'Đặt vé',
                            style:
                                TextStyle(fontSize: 8.0, color: Colors.white),
                          )))),
              Positioned(
                  left: 10.0,
                  top: 10.0,
                  child: Column(children: [
                    Text(
                      '${value.value.name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    Text(
                        '${value.value.runtime} min, ngay: ${value.value.premiered}')
                  ]))
            ])));
  }

  @override
  HomePageProvider initProvider() {
    HomePageProvider provider = HomePageProvider(this);
    return provider;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
