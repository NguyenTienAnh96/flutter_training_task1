import 'dart:convert';

class Header {
  double _score;
  Show _show;

  Header({double score, Show show}) {
    this._score = score;
    this._show = show;
  }

  double get score => _score;
  set score(double score) => _score = score;
  Show get show => _show;
  set show(Show show) => _show = show;

  Header.fromJson(Map<String, dynamic> json) {
    _score = json['score'];
    _show = json['show'] != null ? new Show.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this._score;
    if (this._show != null) {
      data['show'] = this._show.toJson();
    }
    return data;
  }

  static List<Header> parseList(String jsondata) {
    final data = json.decode(jsondata) as List<dynamic>;
    List<Header> list = [];
    data.forEach((element) {
      list.add(Header.fromJson(element));
    });

    return list;
  }
}

class Show {
  int _id;
  String _url;
  String _name;
  String _type;
  String _language;
  List<String> _genres;
  String _status;
  int _runtime;
  String _premiered;
  String _officialSite;
  Schedule _schedule;
  Rating _rating;
  int _weight;
  Network _network;
  String _webChannel;
  Externals _externals;
  Image _image;
  String _summary;
  int _updated;
  Links _lLinks;

  Show(
      {int id,
      String url,
      String name,
      String type,
      String language,
      List<String> genres,
      String status,
      int runtime,
      String premiered,
      Null officialSite,
      Schedule schedule,
      Rating rating,
      int weight,
      Network network,
      String webChannel,
      Externals externals,
      Image image,
      String summary,
      int updated,
      Links lLinks}) {
    this._id = id;
    this._url = url;
    this._name = name;
    this._type = type;
    this._language = language;
    this._genres = genres;
    this._status = status;
    this._runtime = runtime;
    this._premiered = premiered;
    this._officialSite = officialSite;
    this._schedule = schedule;
    this._rating = rating;
    this._weight = weight;
    this._network = network;
    this._webChannel = webChannel;
    this._externals = externals;
    this._image = image;
    this._summary = summary;
    this._updated = updated;
    this._lLinks = lLinks;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get url => _url;
  set url(String url) => _url = url;
  String get name => _name;
  set name(String name) => _name = name;
  String get type => _type;
  set type(String type) => _type = type;
  String get language => _language;
  set language(String language) => _language = language;
  List<String> get genres => _genres;
  set genres(List<String> genres) => _genres = genres;
  String get status => _status;
  set status(String status) => _status = status;
  int get runtime => _runtime;
  set runtime(int runtime) => _runtime = runtime;
  String get premiered => _premiered;
  set premiered(String premiered) => _premiered = premiered;
  String get officialSite => _officialSite;
  set officialSite(String officialSite) => _officialSite = officialSite;
  Schedule get schedule => _schedule;
  set schedule(Schedule schedule) => _schedule = schedule;
  Rating get rating => _rating;
  set rating(Rating rating) => _rating = rating;
  int get weight => _weight;
  set weight(int weight) => _weight = weight;
  Network get network => _network;
  set network(Network network) => _network = network;
  String get webChannel => _webChannel;
  set webChannel(String webChannel) => _webChannel = webChannel;
  Externals get externals => _externals;
  set externals(Externals externals) => _externals = externals;
  Image get image => _image;
  set image(Image image) => _image = image;
  String get summary => _summary;
  set summary(String summary) => _summary = summary;
  int get updated => _updated;
  set updated(int updated) => _updated = updated;
  Links get lLinks => _lLinks;
  set lLinks(Links lLinks) => _lLinks = lLinks;

  Show.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _url = json['url'];
    _name = json['name'];
    _type = json['type'];
    _language = json['language'];
    _genres = json['genres'].cast<String>();
    _status = json['status'];
    _runtime = json['runtime'];
    _premiered = json['premiered'];
    _officialSite = json['officialSite'];
    _schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
    _rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    _weight = json['weight'];
    _network =
        json['network'] != null ? new Network.fromJson(json['network']) : null;
    _webChannel = json['webChannel'].toString();
    _externals = json['externals'] != null
        ? new Externals.fromJson(json['externals'])
        : null;
    _image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    _summary = json['summary'];
    _updated = json['updated'];
    _lLinks =
        json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['url'] = this._url;
    data['name'] = this._name;
    data['type'] = this._type;
    data['language'] = this._language;
    data['genres'] = this._genres;
    data['status'] = this._status;
    data['runtime'] = this._runtime;
    data['premiered'] = this._premiered;
    data['officialSite'] = this._officialSite;
    if (this._schedule != null) {
      data['schedule'] = this._schedule.toJson();
    }
    if (this._rating != null) {
      data['rating'] = this._rating.toJson();
    }
    data['weight'] = this._weight;
    if (this._network != null) {
      data['network'] = this._network.toJson();
    }
    data['webChannel'] = this._webChannel;
    if (this._externals != null) {
      data['externals'] = this._externals.toJson();
    }
    if (this._image != null) {
      data['image'] = this._image.toJson();
    }
    data['summary'] = this._summary;
    data['updated'] = this._updated;
    if (this._lLinks != null) {
      data['_links'] = this._lLinks.toJson();
    }
    return data;
  }
}

class Schedule {
  String _time;
  List<String> _days;

  Schedule({String time, List<String> days}) {
    this._time = time;
    this._days = days;
  }

  String get time => _time;
  set time(String time) => _time = time;
  List<String> get days => _days;
  set days(List<String> days) => _days = days;

  Schedule.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _days = json['days'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this._time;
    data['days'] = this._days;
    return data;
  }
}

class Rating {
  double _average;

  Rating({double average}) {
    this._average = average;
  }

  double get average => _average;
  set average(double average) => _average = average;

  Rating.fromJson(Map<String, dynamic> json) {
    _average = json['average'] is String ? double.parse(json['average']) : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this._average;
    return data;
  }
}

class Network {
  int _id;
  String _name;
  Country _country;

  Network({int id, String name, Country country}) {
    this._id = id;
    this._name = name;
    this._country = country;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  Country get country => _country;
  set country(Country country) => _country = country;

  Network.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    if (this._country != null) {
      data['country'] = this._country.toJson();
    }
    return data;
  }
}

class Country {
  String _name;
  String _code;
  String _timezone;

  Country({String name, String code, String timezone}) {
    this._name = name;
    this._code = code;
    this._timezone = timezone;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get code => _code;
  set code(String code) => _code = code;
  String get timezone => _timezone;
  set timezone(String timezone) => _timezone = timezone;

  Country.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
    _timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    data['timezone'] = this._timezone;
    return data;
  }
}

class Externals {
  int _tvrage;
  int _thetvdb;
  String _imdb;

  Externals({int tvrage, int thetvdb, String imdb}) {
    this._tvrage = tvrage;
    this._thetvdb = thetvdb;
    this._imdb = imdb;
  }

  int get tvrage => _tvrage;
  set tvrage(int tvrage) => _tvrage = tvrage;
  int get thetvdb => _thetvdb;
  set thetvdb(int thetvdb) => _thetvdb = thetvdb;
  String get imdb => _imdb;
  set imdb(String imdb) => _imdb = imdb;

  Externals.fromJson(Map<String, dynamic> json) {
    _tvrage = json['tvrage'];
    _thetvdb = json['thetvdb'];
    _imdb = json['imdb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tvrage'] = this._tvrage;
    data['thetvdb'] = this._thetvdb;
    data['imdb'] = this._imdb;
    return data;
  }
}

class Image {
  String _medium;
  String _original;

  Image({String medium, String original}) {
    this._medium = medium;
    this._original = original;
  }

  String get medium => _medium;
  set medium(String medium) => _medium = medium;
  String get original => _original;
  set original(String original) => _original = original;

  Image.fromJson(Map<String, dynamic> json) {
    _medium = json['medium'];
    _original = (json ?? {})['original'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this._medium;
    data['original'] = this._original;
    return data;
  }
}

class Links {
  Self _self;
  Self _previousepisode;

  Links({Self self, Self previousepisode}) {
    this._self = self;
    this._previousepisode = previousepisode;
  }

  Self get self => _self;
  set self(Self self) => _self = self;
  Self get previousepisode => _previousepisode;
  set previousepisode(Self previousepisode) =>
      _previousepisode = previousepisode;

  Links.fromJson(Map<String, dynamic> json) {
    _self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    _previousepisode = json['previousepisode'] != null
        ? new Self.fromJson(json['previousepisode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._self != null) {
      data['self'] = this._self.toJson();
    }
    if (this._previousepisode != null) {
      data['previousepisode'] = this._previousepisode.toJson();
    }
    return data;
  }
}

class Self {
  String _href;

  Self({String href}) {
    this._href = href;
  }

  String get href => _href;
  set href(String href) => _href = href;

  Self.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    return data;
  }
}
