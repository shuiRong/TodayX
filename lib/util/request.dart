import 'package:http/http.dart' as http;

class Request {
  // get请求的封装，传入的两个参数分别是请求URL和请求参数，请求参数以map的形式传入，会在方法体中自动拼接到URL后面
  static Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer stringBuffer = StringBuffer("?");
      params.forEach((key, value) {
        stringBuffer.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = stringBuffer.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    http.Response res = await http.get(url);
    return res.body;
  }

  // post请求
  static Future<String> post(String url, {Map<String, String> params}) async {
    http.Response res = await http.post(url, body: params);
    return res.body;
  }
}
