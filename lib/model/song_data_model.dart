class SongDataModel {
  Albums? albums;
  Albums? songs;
  Albums? playlists;
  Albums? artists;
  Albums? topquery;
  Albums? shows;

  SongDataModel({
    this.albums,
    this.songs,
    this.playlists,
    this.artists,
    this.topquery,
    this.shows,
  });

  SongDataModel.fromJson(Map<String, dynamic> json) {
    albums =
        json['albums'] != null ? new Albums.fromJson(json['albums']) : null;
    songs = json['songs'] != null ? new Albums.fromJson(json['songs']) : null;
    playlists = json['playlists'] != null
        ? new Albums.fromJson(json['playlists'])
        : null;
    artists =
        json['artists'] != null ? new Albums.fromJson(json['artists']) : null;
    topquery =
        json['topquery'] != null ? new Albums.fromJson(json['topquery']) : null;
    shows = json['shows'] != null ? new Albums.fromJson(json['shows']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albums != null) {
      data['albums'] = this.albums!.toJson();
    }
    if (this.songs != null) {
      data['songs'] = this.songs!.toJson();
    }
    if (this.playlists != null) {
      data['playlists'] = this.playlists!.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.toJson();
    }
    if (this.topquery != null) {
      data['topquery'] = this.topquery!.toJson();
    }
    if (this.shows != null) {
      data['shows'] = this.shows!.toJson();
    }

    return data;
  }
}

class Albums {
  List<AlbumsData>? data;
  int? position;

  Albums({this.data, this.position});

  Albums.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AlbumsData>[];
      json['data'].forEach((v) {
        data!.add(new AlbumsData.fromJson(v));
      });
    }
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    return data;
  }
}

class AlbumsData {
  String? id;
  String? title;
  String? image;
  String? music;
  String? url;
  String? type;
  String? description;
  int? ctr;
  int? position;
  MoreInfo? moreInfo;

  AlbumsData(
      {this.id,
      this.title,
      this.image,
      this.music,
      this.url,
      this.type,
      this.description,
      this.ctr,
      this.position,
      this.moreInfo});

  AlbumsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    music = json['music'];
    url = json['url'];
    type = json['type'];
    description = json['description'];
    ctr = json['ctr'];
    position = json['position'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['music'] = this.music;
    data['url'] = this.url;
    data['type'] = this.type;
    data['description'] = this.description;
    data['ctr'] = this.ctr;
    data['position'] = this.position;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? image;
  String? album;
  String? url;
  String? type;
  String? description;
  int? ctr;
  int? position;
  MoreInfo? moreInfo;

  Data(
      {this.id,
      this.title,
      this.image,
      this.album,
      this.url,
      this.type,
      this.description,
      this.ctr,
      this.position,
      this.moreInfo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    album = json['album'];
    url = json['url'];
    type = json['type'];
    description = json['description'];
    ctr = json['ctr'];
    position = json['position'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['album'] = this.album;
    data['url'] = this.url;
    data['type'] = this.type;
    data['description'] = this.description;
    data['ctr'] = this.ctr;
    data['position'] = this.position;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    return data;
  }
}

class MoreInfo {
  String? vcode;
  String? vlink;
  String? primaryArtists;
  String? singers;
  Null? videoAvailable;
  bool? trillerAvailable;
  String? language;

  MoreInfo(
      {this.vcode,
      this.vlink,
      this.primaryArtists,
      this.singers,
      this.videoAvailable,
      this.trillerAvailable,
      this.language});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    vcode = json['vcode'];
    vlink = json['vlink'];
    primaryArtists = json['primary_artists'];
    singers = json['singers'];
    videoAvailable = json['video_available'];
    trillerAvailable = json['triller_available'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vcode'] = this.vcode;
    data['vlink'] = this.vlink;
    data['primary_artists'] = this.primaryArtists;
    data['singers'] = this.singers;
    data['video_available'] = this.videoAvailable;
    data['triller_available'] = this.trillerAvailable;
    data['language'] = this.language;
    return data;
  }
}

class SongData {
  String? id;
  String? title;
  String? image;
  String? extra;
  String? url;
  String? language;
  String? type;
  String? description;
  int? position;
  Null? moreInfo;

  SongData(
      {this.id,
      this.title,
      this.image,
      this.extra,
      this.url,
      this.language,
      this.type,
      this.description,
      this.position,
      this.moreInfo});

  SongData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    extra = json['extra'];
    url = json['url'];
    language = json['language'];
    type = json['type'];
    description = json['description'];
    position = json['position'];
    moreInfo = json['more_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['extra'] = this.extra;
    data['url'] = this.url;
    data['language'] = this.language;
    data['type'] = this.type;
    data['description'] = this.description;
    data['position'] = this.position;
    data['more_info'] = this.moreInfo;
    return data;
  }
}
