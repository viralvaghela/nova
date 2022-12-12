import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';

import '../constants/configs.dart';

class DownloaderService {
  static Future getSongDetails(var song) async {
    var url = Config.detailsUrl + song;
    var response = await http.get(Uri.parse(url));
    return response;
  }

  static Future getSongDownloadLink(var song) async {
    var url = Config.downloadUrl + song;
    var response = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(response.body);
    String song_url = jsondata[song]["media_preview_url"];
    song_url = song_url.replaceAll("preview", "aac");

    if (jsondata['320kbps'] == "true") {
      song_url = song_url.replaceAll("_96_p.mp4", "_320.mp4");
    } else {
      song_url = song_url.replaceAll("_96_p.mp4", "_160.mp4");
    }
    // AudioSource.uri(
    //   Uri.parse(song_url),
    //   tag: MediaItem(
    //     // Specify a unique ID for each media item:
    //     id: '1',
    //     // Metadata to display in the notification:
    //     album: "Album name",
    //     title: "Song name",
    //     artUri: Uri.parse('https://example.com/albumart.jpg'),
    //   ),
    // );
    return song_url;
  }
}
