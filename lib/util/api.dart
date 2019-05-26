import 'dart:async';
import 'dart:math';
import './request.dart';
import 'dart:convert';

class API {
  static Future<Map> poetry() async {
    var url = "https://api.gushi.ci/all.json";
    String body = await Request.get(url);
    var obj = json.decode(body);
    return obj;
  }

  static Future<Map> sentence() async {
    var url = "https://v1.hitokoto.cn/";
    String body = await Request.get(url);
    try {
      var obj = json.decode(body);
      var hitokoto = obj['hitokoto'];
      var from = obj['from'];

      return {'hitokoto': hitokoto, 'from': '—— ' + from};
    } catch (e) {
      print('接口又返回html而不是json了');
      return {'hitokoto': '', 'from': ''};
    }
  }

  static Future<Map> picture() async {
    var url = "https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1";
    String body = await Request.get(url);
    var obj = json.decode(body);
    var image = obj['images'][0];

    return image;
  }

  static Future<Map> music() async {
    var url = "https://music.aityp.com/playlist/detail?id=145787433";
    String body = await Request.get(url);
    var obj = json.decode(body);
    var tracks = obj['playlist']['tracks'];

    var randomIndex = new Random().nextInt(tracks.length);
    var song = tracks[randomIndex];
    var songId = song['id'];

    var musicUrl = await getMusicUrl(songId);

    return {
      'url': musicUrl,
      'author': song['ar'][0]['name'],
      'picUrl': song['al']['picUrl'],
      'name': song['name']
    };
  }

  static Future<String> getMusicUrl(id) async {
    var url = "https://music.aityp.com/song/url?id=$id";
    String body = await Request.get(url);
    var obj = json.decode(body);
    var musicUrl = obj['data'][0]['url'];

    return musicUrl;
  }

  static Future<Map> musicComment() async {
    var url = "https://api.comments.hk/";
    String body = await Request.get(url);
    var obj = json.decode(body);

    return {
      'comment': obj['comment_content'],
      'nickname': obj['comment_nickname'],
      'title': obj['title'],
      'author': obj['author']
    };
  }

  static Future<Map> randomColor() async {
    String url = "https://randoma11y.com/stats";
    String body = await Request.get(url);
    Map obj = json.decode(body);
    int index = new Random().nextInt(20);
    Map color = obj['most_active_20'][index];

    String colorOne = color['color_one'].toUpperCase();
    String colorTwo = color['color_two'].toUpperCase();

    return {
      'color_one': '0xff' + colorOne.replaceAll(new RegExp('#'), ''),
      'color_two': '0xff' + colorTwo.replaceAll(new RegExp('#'), ''),
      'color_one_origin': colorOne,
      'color_two_origin': colorTwo,
    };
  }

  static Future<Map> repo() async {
    String url = "https://github-trending-api.now.sh/repositories";
    String body = await Request.get(url);
    List list = json.decode(body);
    int index = new Random().nextInt(25);
    Map repo = list[index];

    return {
      ...repo,
      'name': repo['author'] + ' / ' + repo['name'],
      'stars': repo['stars'].toString(),
      'forks': repo['forks'].toString()
    };
  }

  static Future<Map> zhihuDaily() async {
    String url = "https://news-at.zhihu.com/api/4/news/latest";
    String body = await Request.get(url);
    Map data = json.decode(body);
    List stories = data['stories'];
    stories.addAll(data['top_stories']);
    int index = new Random().nextInt(8);
    Map repo = stories[index];

    return repo;
  }

  static Future<Map> todayInHistory() async {
    String url = "https://api.ooopn.com/history/api.php?type=json";
    String body = await Request.get(url);
    Map data = json.decode(body);
    List content = data['content'];
    int index = new Random().nextInt(content.length);

    return {'day': data['day'], 'content': content[index]};
  }
}
