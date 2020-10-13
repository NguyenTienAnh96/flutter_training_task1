import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_training_movieapp/event/get_data_event.dart';
import 'package:flutter_training_movieapp/model/header.dart';
import 'package:flutter_training_movieapp/page/home_page.dart';
import 'package:flutter_training_movieapp/page/show_detail_page.dart';
import 'package:flutter_training_movieapp/providers/base_notifier.dart';
import 'package:flutter_training_movieapp/providers/base_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePageProvider extends BaseProvider {
  HeaderNotifier _header = HeaderNotifier(List<Header>());
  DangChieuNotifier _dangchieu = DangChieuNotifier(List<Header>());
  DacBietNotifier _dacbiet = DacBietNotifier(List<Header>());
  SapChieuNotifier _sapchieu = SapChieuNotifier(List<Header>());
  Index _index = Index(0.0);
  ShowData _show = ShowData(Show());
  PageController ctrl = PageController();
  double pageOffset = 0.0;
  double viewportFraction = 0.8;
  PageController pageViewController;

  HomePageProvider(HomePageState state) : super(state) {
    getData(getDataEvents.header);
    getData(getDataEvents.dangchieu);
    getData(getDataEvents.dacbiet);
    getData(getDataEvents.sapchieu);
    pageViewController = PageController(viewportFraction: viewportFraction);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void pushShowDetailPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ShowDetaiPage(_show.value)));
  }

  selectTab(int index) {
    if (index == 0) {
      _show.value = _dangchieu.value[0].show;
    } else if (index == 1) {
      _show.value = _dacbiet.value[0].show;
    } else if (index == 2) {
      _show.value = _sapchieu.value[0].show;
    }
  }

  getDataAPI(String key) async {
    final response =
        await http.get('http://api.tvmaze.com/search/shows?q=$key');
    final header = Header.parseList(response.body).toList();
    if (response.statusCode == HttpStatus.ok) {
      return header;
    }
    return [];
  }

  @override
  List<BaseNotifier> initNotifiers() =>
      [_header, _dangchieu, _dacbiet, _index, _show, _sapchieu];

  void startAutoScroll() {
    Timer _timer;
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      if (state.mounted) {
        ctrl.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInToLinear);
      } else {
        _timer.cancel();
      }
    });
  }

  getData(getDataEvents event) async {
    switch (event) {
      case getDataEvents.header:
        final response =
            await http.get('http://api.tvmaze.com/search/shows?q=avengers');
        final header = Header.parseList(response.body);
        if (response.statusCode == HttpStatus.ok) {
          _header.value = header;
          startAutoScroll();
        }

        break;
      case getDataEvents.dangchieu:
        final response =
            await http.get('http://api.tvmaze.com/search/shows?q=vietnam');
        final dangchieu = Header.parseList(response.body);
        if (response.statusCode == HttpStatus.ok) {
          _dangchieu.value = dangchieu;
          _show.value = _dangchieu.value[0].show;
        }
        break;
      case getDataEvents.dacbiet:
        final response =
            await http.get('http://api.tvmaze.com/search/shows?q=funny');
        final dacbiet = Header.parseList(response.body);
        if (response.statusCode == HttpStatus.ok) {
          _dacbiet.value = dacbiet;
        }
        break;
      case getDataEvents.sapchieu:
        final response =
            await http.get('http://api.tvmaze.com/search/shows?q=cartoon');
        final header = Header.parseList(response.body);
        if (response.statusCode == HttpStatus.ok) {
          _sapchieu.value = header;
          startAutoScroll();
        }
        break;
      default:
        break;
    }
  }

  getDataShow(Show show) {
    if (show != null) {
      _show.value = show;
    }
  }

  getHeaderAt(int index) => _header.value == null || (_header.value.isEmpty)
      ? null
      : index != null ? _header.value[index % _header.value.length] : null;
  getDangChieuAt(int index) =>
      _dangchieu.value == null || (_dangchieu.value.isEmpty)
          ? null
          : index != null
              ? _dangchieu.value[index % _dangchieu.value.length]
              : null;

  getDacBietAt(int index) => _dacbiet.value == null ||
          (_dangchieu.value.isEmpty)
      ? null
      : index != null ? _dacbiet.value[index % _dacbiet.value.length] : null;
  getSapChieuAt(int index) => _sapchieu.value == null ||
          (_sapchieu.value.isEmpty)
      ? null
      : index != null ? _sapchieu.value[index % _sapchieu.value.length] : null;
  setIndex() {
    this._index.value = ctrl.page;
    print('123 dada: ${_index.value}');
  }
}

class HeaderNotifier extends BaseNotifier<List<Header>> {
  HeaderNotifier(List<Header> value) : super(value);

  @override
  ListenableProvider<Listenable> provider() =>
      ChangeNotifierProvider<HeaderNotifier>(
        create: (context) => this,
      );
}

class DangChieuNotifier extends BaseNotifier<List<Header>> {
  DangChieuNotifier(List<Header> value) : super(value);

  @override
  ListenableProvider<Listenable> provider() =>
      ChangeNotifierProvider<DangChieuNotifier>(
        create: (context) => this,
      );
}

class DacBietNotifier extends BaseNotifier<List<Header>> {
  DacBietNotifier(List<Header> value) : super(value);

  @override
  ListenableProvider<Listenable> provider() =>
      ChangeNotifierProvider<DacBietNotifier>(
        create: (context) => this,
      );
}

class SapChieuNotifier extends BaseNotifier<List<Header>> {
  SapChieuNotifier(List<Header> value) : super(value);

  @override
  ListenableProvider<Listenable> provider() =>
      ChangeNotifierProvider<SapChieuNotifier>(
        create: (context) => this,
      );
}

class Index extends BaseNotifier<double> {
  Index(double value) : super(value);

  @override
  ListenableProvider<Listenable> provider() => ChangeNotifierProvider<Index>(
        create: (context) => this,
      );
}

class ShowData extends BaseNotifier<Show> {
  ShowData(Show value) : super(value);

  @override
  ListenableProvider<Listenable> provider() => ChangeNotifierProvider<ShowData>(
        create: (context) => this,
      );
}
