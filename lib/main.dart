import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import './util/api.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Map picture = {'url': '', 'copyright': '', 'copyrightlink': ''};
  Map sentence = {'hitokoto': '', 'from': ''};
  Map poetry = {'content': '', 'origin': '', 'author': ''};
  Map music = {'url': '', 'picUrl': '', 'author': '', 'name': ''};
  Map musicComment = {'comment': '', 'nickname': '', 'title': '', 'author': ''};
  String math = '';

  AudioPlayer audioPlayer = new AudioPlayer();
  bool isPlaying = false;
  GlobalKey<RefreshHeaderState> _headerKey1 =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey2 =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey3 =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey4 =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey5 =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey6 =
      new GlobalKey<RefreshHeaderState>();

  RandomWordsState() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('1111 ' + math);
    _loadPicture();
    _loadSentence();
    _loadPoetry();
    _loadMusic();
    _loadMusicComment();
    _loadMath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: null,
            body: TabBarView(
              children: [
                _buildPicture(),
                _buildSentence(),
                _buildMusic(),
                _buildMusicComment(),
                _buildPoetry(),
                _buildMath()
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ));
  }

  _loadPicture() {
    API.picture().then((obj) {
      setState(() {
        picture = {...obj, 'url': 'https://cn.bing.com/' + obj['url']};
      });
    });
  }

  _buildPicture() {
    final int backgroundColor = 0xFFFFCDB2;
    final int textColor = 0xFF6D6875;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey1,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(backgroundColor),
              height: height,
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '图片',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.25),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 50),
                            child: (picture['url'].isNotEmpty
                                ? Image.network(picture['url'])
                                : null)),
                        Text(
                          picture['copyright'],
                          style: TextStyle(
                            color: Color(textColor),
                            fontSize: 15,
                            height: 1.3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadPicture();
      },
    );
  }

  _loadSentence() {
    API.sentence().then((obj) {
      setState(() {
        sentence = {...obj, 'from': '—— ' + obj['from']};
      });
    });
  }

  _buildSentence() {
    final int backgroundColor = 0xFF06AED5;
    final int textColor = 0xFFFFF1D0;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey4,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(backgroundColor),
              height: height,
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '名言',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.42),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: new EdgeInsets.only(bottom: 50),
                            child: Text(
                              sentence['hitokoto'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 22.0,
                                height: 1.3,
                              ),
                            )),
                        Text(
                          sentence['from'],
                          style: TextStyle(
                            color: Color(textColor),
                            fontSize: 15,
                            height: 1.3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadSentence();
      },
    );
  }

  _buildPoetry() {
    final int backgroundColor = 0xFF6FFFE9;
    final int textColor = 0xFF0B132B;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey2,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(backgroundColor),
              height: height,
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '诗歌',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.42),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: new EdgeInsets.only(bottom: 50),
                            child: Text(
                              poetry['content'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 22.0,
                                height: 1.3,
                              ),
                            )),
                        Text(
                          poetry['author'],
                          style: TextStyle(
                            color: Color(textColor),
                            fontSize: 15,
                            height: 1.3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadPoetry();
      },
    );
  }

  _loadPoetry() {
    API.poetry().then((obj) {
      setState(() {
        poetry = {...obj, 'author': '—— ' + obj['author']};
      });
    });
  }

  _loadMusic() {
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
    API.music().then((obj) {
      setState(() {
        music = obj;
      });
    });
  }

  play() async {
    int result = await audioPlayer.play(music['url']);
    if (result == 1) {
      // success
      setState(() {
        isPlaying = true;
      });
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  _buildMusic() {
    final int backgroundColor = 0xFFD13C37;
    final int textColor = 0xFF0D2C54;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey3,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(backgroundColor),
              height: height,
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '音乐',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.2),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: music['picUrl'].isNotEmpty
                                ? Image.network(music['picUrl'])
                                : null),
                        (isPlaying
                            ? IconButton(
                                onPressed: pause,
                                icon:
                                    Icon(Icons.pause, color: Color(textColor)))
                            : IconButton(
                                onPressed: play,
                                icon: Icon(Icons.play_arrow,
                                    color: Color(textColor)))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              music['name'],
                              style: TextStyle(
                                  color: Color(textColor),
                                  fontSize: 20,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold),
                            )),
                        Text(
                          music['author'],
                          style: TextStyle(
                            color: Color(textColor),
                            fontSize: 13,
                            height: 1.3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadMusic();
      },
    );
  }

  // 网易云评论
  _buildMusicComment() {
    final int backgroundColor = 0xFF003049;
    final int textColor = 0xFFEAE2B7;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey5,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(backgroundColor),
              height: height,
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '评论',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.32),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: new EdgeInsets.only(bottom: 50),
                            child: AutoSizeText(
                              musicComment['comment'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 20.0,
                                height: 1.3,
                              ),
                              maxLines: 5,
                            )),
                        Text(
                          musicComment['nickname'],
                          style: TextStyle(
                            color: Color(textColor),
                            fontSize: 15,
                            height: 1.3,
                          ),
                        ),
                        Text(
                          musicComment['author'],
                          style: TextStyle(
                            color: Color(textColor),
                            fontSize: 15,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadMusicComment();
      },
    );
  }

  _loadMusicComment() {
    API.musicComment().then((obj) {
      setState(() {
        musicComment = {
          ...obj,
          'author': '《' + obj['title'] + '》 —— ' + obj['author'],
          'nickname': '@' + obj['nickname']
        };
      });
    });
  }

  _loadMath() {
    DefaultAssetBundle.of(context)
        .loadString("./lib/assets/math.json")
        .then((data) {
      final result = json.decode(data);
      String index = new Random().nextInt(8).toString();
      setState(() {
        math = result[index];
      });
    });
  }

  _buildMath() {
    final int backgroundColor = 0xFFFFCDB2;
    final int textColor = 0xFF6D6875;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey6,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(backgroundColor),
              height: height,
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '高等数学',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.4),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 50),
                            child: math == null
                                ? null
                                : Image.memory(Base64Decoder().convert(math))),
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadMath();
      },
    );
  }
}
