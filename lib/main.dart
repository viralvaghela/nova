import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nova/model/song_data_model.dart';
import 'package:nova/services/downloader.dart';
import 'package:path_provider/path_provider.dart';

import 'constants/configs.dart';

void main() async {
  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //   androidNotificationChannelName: 'Audio playback',
  //   androidNotificationOngoing: true,
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _controller =
      TextEditingController(text: "night");
  bool _isLoading = false;
  Dio dio = Dio();
  Future downloadSong(String url, String filename) async {
    //savepath
    var dir = await getExternalStorageDirectory();
    var savePath = dir!.path + "/" + filename;
    //download

    await dio.download(url, savePath, onReceiveProgress: showDownloadProgress);
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter a search term',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      var data = await DownloaderService.getSongDetails(
                          _controller.text);
                      var jsonData = jsonDecode(data.body);
                      SongDataModel songDataModel =
                          SongDataModel.fromJson(jsonData);
                      if (songDataModel.songs!.data!.isNotEmpty) {
                        setState(() {
                          _isLoading = false;
                        });
                        //Display ListView on Alert Dialog
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Results"),
                                content: Container(
                                  height: 300,
                                  width: 300,
                                  child: ListView.builder(
                                      itemCount:
                                          songDataModel.songs!.data!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(songDataModel
                                              .songs!.data![index].title!),
                                          subtitle: Text(songDataModel.songs!
                                              .data![index].moreInfo!.singers!),
                                          onTap: () async {
                                            var songId = songDataModel
                                                .songs!.data![index].id;
                                            String link =
                                                await DownloaderService
                                                    .getSongDownloadLink(
                                                        songId);
                                            downloadSong(link, "asd.mp4");
                                            Navigator.pop(context);
                                          },
                                        );
                                      }),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  )
                                ],
                              );
                            });
                      } else {
                        setState(() {
                          _isLoading = false;
                        });
                        AlertDialog(
                          title: const Text("No results found"),
                          content: const Text("Please try again"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            )
                          ],
                        );
                      }

                      print(songDataModel.songs!.data![0].id);
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  )
                ],
              ),
            ),
    );
  }
}
