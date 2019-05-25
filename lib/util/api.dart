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
    var obj = json.decode(body);
    var hitokoto = obj['hitokoto'];
    var from = obj['from'];

    return {'hitokoto': hitokoto, 'from': from};
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
    Map color = obj['most_active_20'][0];

    String colorOne = color['color_one'];
    String colorTwo = color['color_two'];

    return {
      'color_one': '0xff' + colorOne.replaceAll(new RegExp('#'), ''),
      'color_two': '0xff' + colorTwo.replaceAll(new RegExp('#'), ''),
      'color_one_origin': colorOne,
      'color_two_origin': colorTwo,
    };
  }
}
