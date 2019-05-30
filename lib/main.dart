import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';
import './util/api.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));
  debugPaintSizeEnabled = false;
}

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

class RandomWordsState extends State<RandomWords>
    with SingleTickerProviderStateMixin {
  Map picture = {'url': '', 'copyright': '', 'copyrightlink': ''};
  Map sentence = {'hitokoto': '', 'from': ''};
  Map poetry = {'content': '', 'origin': '', 'author': ''};
  Map music = {'url': '', 'picUrl': '', 'author': '', 'name': ''};
  Map musicComment = {'comment': '', 'nickname': '', 'title': '', 'author': ''};
  Map randomColor = {
    'color_one': '0xFFFFCDB2',
    'color_two': '0xFF6D6875',
    'color_one_origin': 'FFCDB2',
    'color_two_origin': '6D6875'
  };
  String math = '';
  String chemical = '';
  Map repo = {
    'author': '',
    'description': '',
    'name': '',
    'url': '',
    'stars': '',
    'forks': ''
  };
  Map zhihuDaily = {'title': ''};
  Map today = {'day': '', 'content': ''};
  Map oneArticle = {'author': '', 'title': '', 'content': ''};

  TabController _tabController;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  GlobalKey<RefreshHeaderState> _headerKey1 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey2 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey3 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey4 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey5 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey6 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey7 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey8 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey9 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey10 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey11 = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshHeaderState> _headerKey12 = GlobalKey<RefreshHeaderState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 12);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPicture();
    _loadSentence();
    _loadPoetry();
    _loadMusic();
    _loadMusicComment();
    _loadMath();
    _loadRandomColor();
    _loadChemical();
    _loadRepo();
    _loadZhihuDaily();
    _loadTodayInHistory();
    _loadOneArticle();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget getListTile(String title, int index) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Color(0xff9ABD97))),
      onTap: () {
        to(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 12,
          child: Scaffold(
            appBar: null,
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildPicture(),
                _buildSentence(),
                _buildMusic(),
                _buildMusicComment(),
                _buildPoetry(),
                _buildMath(),
                _buildRandomColor(),
                _buildChemical(),
                _buildRepo(),
                _buildZhihuDaily(),
                _buildTodayInHistory(),
                _buildOneArticle(),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Color(0xff9ABD97),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 50),
                    child: Text('今日份的X',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text('图片'),
                      onTap: () {
                        to(0);
                      },
                    ),
                    ListTile(
                      title: Text('名言'),
                      onTap: () {
                        to(1);
                      },
                    ),
                    ListTile(
                      title: Text('音乐'),
                      onTap: () {
                        to(2);
                      },
                    ),
                    ListTile(
                      title: Text('乐评'),
                      onTap: () {
                        to(3);
                      },
                    ),
                    ListTile(
                      title: Text('诗歌'),
                      onTap: () {
                        to(4);
                      },
                    ),
                    ListTile(
                      title: Text('高等数学'),
                      onTap: () {
                        to(5);
                      },
                    ),
                    ListTile(
                      title: Text('色彩'),
                      onTap: () {
                        to(6);
                      },
                    ),
                    ListTile(
                      title: Text('化学方程式'),
                      onTap: () {
                        to(7);
                      },
                    ),
                    ListTile(
                      title: Text('Github Repository'),
                      onTap: () {
                        to(8);
                      },
                    ),
                    ListTile(
                      title: Text('知乎日报'),
                      onTap: () {
                        to(9);
                      },
                    ),
                    ListTile(
                      title: Text('历史上的今天'),
                      onTap: () {
                        to(10);
                      },
                    ),
                    ListTile(
                      title: Text('文章'),
                      onTap: () {
                        to(11);
                      },
                    )
                  ])),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black26, width: 0.7))),
                child: ListTile(
                  title: Text('关于'),
                  onTap: () {
                    launch('https://github.com/shuiRong/TodayX');
                  },
                ),
              )
            ],
          ),
        ));
  }

  to(int where) {
    Navigator.pop(context);
    _tabController.animateTo(where);
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
                    padding: EdgeInsets.only(bottom: height * 0.3),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 30),
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
        sentence = obj;
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
                            padding: EdgeInsets.only(bottom: 30),
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
    final int textColor = 0xFF292F36;
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
                    padding: EdgeInsets.only(bottom: height * 0.40),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 30),
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
                        '乐评',
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
                            padding: EdgeInsets.only(bottom: 50),
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
      String index = Random().nextInt(8).toString();
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

  _loadRandomColor() {
    API.randomColor().then((obj) {
      setState(() {
        randomColor = obj;
      });
    });
  }

  _buildRandomColor() {
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey7,
      ),
      child: SingleChildScrollView(
          child: Container(
              color: Color(int.parse(randomColor['color_one'])),
              height: height,
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        '色彩',
                        style: TextStyle(
                          color: Color(int.parse(randomColor['color_two'])),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.45),
                    child:
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                          height: 70,
                          width: 155,
                          child: Text(randomColor['color_two_origin'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Color(int.parse(randomColor['color_two'])),
                                fontSize: 35,
                                height: 1.45,
                                fontWeight: FontWeight.bold,
                              ))),
                      Container(
                          color: Color(int.parse(randomColor['color_two'])),
                          height: 70,
                          width: 155,
                          child: Text(randomColor['color_one_origin'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Color(int.parse(randomColor['color_one'])),
                                fontSize: 35,
                                height: 1.45,
                                fontWeight: FontWeight.bold,
                              )))
                    ]),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadRandomColor();
      },
    );
  }

  _loadChemical() {
    DefaultAssetBundle.of(context)
        .loadString("./lib/assets/chemical.json")
        .then((data) {
      final result = json.decode(data);
      String index = Random().nextInt(14).toString();
      setState(() {
        chemical = result[index];
      });
    });
  }

  _buildChemical() {
    final int backgroundColor = 0xFFB2FF9E;
    final int textColor = 0xFF3C1642;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey8,
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
                        '化学方程式',
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
                            child: chemical == null
                                ? null
                                : Image.memory(
                                    Base64Decoder().convert(chemical),
                                    width: width * 0.6)),
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadChemical();
      },
    );
  }

  _buildRepo() {
    final int backgroundColor = 0xFF2541B2;
    final int textColor = 0xFFFFFFFF;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey9,
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
                        'Github Repository',
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
                        InkWell(
                            child: Text(
                              repo['name'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 20,
                                height: 1.3,
                              ),
                            ),
                            onTap: () => launch(repo['url'])),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                            child: AutoSizeText(
                              repo['description'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 15,
                                height: 1.3,
                              ),
                              maxLines: 5,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star, color: Color(textColor)),
                            Text(
                              repo['stars'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 17,
                                height: 1.2,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(AntDesign.getIconData("fork"),
                                    color: Color(textColor), size: 17)),
                            Text(
                              repo['forks'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 17,
                                height: 1.2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )))),
      onRefresh: () async {
        _loadRepo();
      },
    );
  }

  _loadRepo() {
    API.repo().then((obj) {
      setState(() {
        repo = obj;
      });
    });
  }

  _buildZhihuDaily() {
    final int backgroundColor = 0xFF944BBB;
    final int textColor = 0xFFE6C79C;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey10,
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
                        '知乎日报',
                        style: TextStyle(
                          color: Color(textColor),
                          fontSize: 15,
                          height: 1.3,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: height * 0.5),
                      child: InkWell(
                          child: Text(
                            zhihuDaily['title'],
                            style: TextStyle(
                              color: Color(textColor),
                              fontSize: 20,
                              height: 1.3,
                            ),
                          ),
                          onTap: () => launch('https://daily.zhihu.com/story/' +
                              zhihuDaily["id"].toString())))
                ],
              )))),
      onRefresh: () async {
        _loadZhihuDaily();
      },
    );
  }

  _loadZhihuDaily() {
    API.zhihuDaily().then((obj) {
      setState(() {
        zhihuDaily = obj;
      });
    });
  }

  _loadTodayInHistory() {
    API.todayInHistory().then((obj) {
      setState(() {
        today = obj;
      });
    });
  }

  _buildTodayInHistory() {
    final int backgroundColor = 0xFF06AED5;
    final int textColor = 0xFFFFF1D0;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey11,
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
                        '历史上的今天',
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
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              today['content'],
                              style: TextStyle(
                                color: Color(textColor),
                                fontSize: 22.0,
                                height: 1.3,
                              ),
                            )),
                        Text(
                          today['day'],
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
        _loadTodayInHistory();
      },
    );
  }

  _loadOneArticle() {
    API.oneArticle().then((result) {
      setState(() {
        oneArticle = result;
      });
    });
  }

  _buildOneArticle() {
    final int textColor = 0xFFFFF1D0;
    final height = MediaQuery.of(context).size.height;

    return EasyRefresh(
      refreshHeader: MaterialHeader(
        key: _headerKey12,
      ),
      child: Container(
        color: Colors.blueGrey,
        height: height,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //标题
              Text(
                oneArticle['title'],
                style: TextStyle(
                  color: Color(textColor),
                  fontSize: 23,
                ),
              ),
              //作者
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  oneArticle['author'],
                  style: TextStyle(
                    color: Color(textColor),
                  ),
                ),
              ),
              //正文
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    oneArticle['content'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(textColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onRefresh: () async {
        _loadOneArticle();
      },
    );
  }
}
