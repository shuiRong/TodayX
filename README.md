# 今日份的X

> 这是一个`Flutter`写的**一个无聊的App**
>
> **每天推荐一个不同的：图片、诗歌、名言、音乐、乐评、高等数学、两种配色、化学方程式、Github Repo、知乎问题。**
>
> （P.S. 除图片来自Bing首页，每天仅有一张外，其他页面支持下拉刷新来更新内容）

**[下载APK](https://github.com/shuiRong/TodayX/releases/download/v1.0.0/TodayX.apk)**



#### 效果预览

------

| ![TodayX](./preview/1.png)  | ![TodayX](./preview/2.png)  | ![TodayX](./preview/3.png)  |
| --------------------------- | --------------------------- | --------------------------- |
| ![TodayX](./preview/4.png)  | ![TodayX](./preview/5.png)  | ![TodayX](./preview/6.png)  |
| ![TodayX](./preview/7.png)  | ![TodayX](./preview/8.png)  | ![TodayX](./preview/9.png)  |
| ![TodayX](./preview/10.png) | ![TodayX](./preview/11.png) | ![TodayX](./preview/12.png) |



> **Flutter初试感受**：去玩`Swift`了 :p 

#### 如何运行：

---

首先确保你本地有 Flutter 项目所需环境，官方文档 [英文教程](https://flutter.dev/docs/get-started/install) [中文文档](https://flutter-io.cn/docs)

**下载项目：**

```bash
git clone https://github.com/shuiRong/TodayX
cd ./TodayX
```



运行项目前需要通过 USB 将手机连接到电脑上或者启动模拟器，遵循官方教程即可。

然后**运行项目**：

（如果你使用 Visual Studio Code 来开发，也可以不通过下述命令行，而是通过全程通过VSC来操作：请参看[第2、3小节](https://flutter-io.cn/docs/get-started/editor?tab=vscode)）

```bash
// 安装项目依赖
flutter packages get
// 运行项目
flutter run
```



#### 项目中用到的第三方数据

---

感谢作者



* 诗歌：`https://api.gushi.ci/all.json`

  ```bash
  // 20190526231929
  {
    "content": "墉集欺猫鼠，林藏逐雀鹯。",
    "origin": "中秋咏怀借杜子美秋日述怀一百韵和寄柳州假鸣桑先生",
    "author": "徐威",
    "category": "古诗文-动物-写猫"
  }
  ```

* 名言：`https://v1.hitokoto.cn/`

  ```bash
  // 20190526232311
  {
    "id": 14,
    "hitokoto": "用你的笑容去改变这个世界，别让这个世界改变了你的笑容。",
    "type": "a",
    "from": "网络",
    "creator": "酱七",
    "created_at": "1468605909"
  }
  ```

* Bing首页图：`https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1`

  ```bash
  // 20190526232348
  {
    "images": [
      {
        "startdate": "20190525",
        "fullstartdate": "201905251600",
        "enddate": "20190526",
        "url": "/th?id=OHR.MarathonduMont_ZH-CN5049722437_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp",
        "urlbase": "/th?id=OHR.MarathonduMont_ZH-CN5049722437",
        "copyright": "圣米歇尔山 (© Leroy Francis/Getty Images)",
        "copyrightlink": "http://www.bing.com/search?q=%E5%9C%A3%E7%B1%B3%E6%AD%87%E5%B0%94%E5%B1%B1&form=hpcapt&mkt=zh-cn",
        "title": "",
        "quiz": "/search?q=Bing+homepage+quiz&filters=WQOskey:%22HPQuiz_20190525_MarathonduMont%22&FORM=HPQUIZ",
        "wp": true,
        "hsh": "02a3db999f76ec114c45de97cecc30ac",
        "drk": 1,
        "top": 1,
        "bot": 1,
        "hs": [
        ]
      }
    ],
    "tooltips": {
      "loading": "正在加载...",
      "previous": "上一个图像",
      "next": "下一个图像",
      "walle": "此图片不能下载用作壁纸。",
      "walls": "下载今日美图。仅限用作桌面壁纸。"
    }
  }
  ```

* 音乐：`https://music.aityp.com/playlist/detail?id=145787433`

  ```
  内容过多不便展示
  ```

* 网易云评论：`https://api.comments.hk/`

  ```bash
  // 20190526232507
  {
    "song_id": 480426313,
    "title": "There For You",
    "images": "https://p2.music.126.net/E_ffmvXrVZoTugVf_Zf4Cg==/18520173860179248.jpg",
    "author": "Martin Garrix",
    "album": "There For You",
    "description": "歌手：Martin Garrix。所属专辑：There For You。",
    "mp3_url": "https://api.comments.hk/music/480426313",
    "pub_date": "2017-05-25 16:00:00",
    "comment_id": 393094070,
    "comment_user_id": 267009137,
    "comment_nickname": "我不吃鱼肉",
    "comment_avatar_url": "https://p1.music.126.net/HC5zku5foEI_rIP9YShyoQ==/109951164014518098.jpg",
    "comment_liked_count": 25271,
    "comment_content": "恭喜\"小马戳\"组合的新单出世!!好期待他们的下一次合作 也希望马丁不要弯不要弯不要弯啊哈哈哈哈哈哈[爱心][爱心][爱心][爱心]",
    "comment_pub_date": "2017-05-25 16:01:38"
  }
  ```

* 随机配色：`https://randoma11y.com/stats`

  ```
  内容过多不便展示
  ```

* Github Trending：`https://github-trending-api.now.sh/repositories`

  ```
  内容过多不便展示
  ```

* 知乎日报：`https://news-at.zhihu.com/api/4/news/latest`

  ```bash
  // 20190526232635
  {
    "date": "20190526",
    "stories": [
      {
        "images": [
          "https://pic2.zhimg.com/v2-58b5abf70967054a9a057d4f1da8f811.jpg"
        ],
        "type": 0,
        "id": 9711762,
        "ga_prefix": "052622",
        "title": "小事 · 你会付出多少去挽救父母的生命？"
      }
   	...
    ],
    "top_stories": [
      {
        "image": "https://pic2.zhimg.com/v2-0dc73b026624fc19637c5cb25ff679a9.jpg",
        "type": 0,
        "id": 9711735,
        "ga_prefix": "052507",
        "title": "为什么牛奶卖不完，宁可倒掉也不免费送人？"
      }
      ...
    ]
  }
  ```

* 历史上的今天：`https://api.ooopn.com/history/api.php?type=json`

  ```bash
  // 20190526232721
  {
    "code": "200",
    "day": "2019年05月26日",
    "content": [
      "刘宋顺帝刘准让帝位于萧道成",
      "爱德华波特亚历山大出生",
      "第一次鸦片战争英军首次进攻广州城",
      "清朝将领和春逝世",
      "英国兼英属自治领皇后玛丽皇后出生",
      "美国记者查尔斯道创造的股票指数道琼斯指数首次发布",
      "俄国沙皇尼古拉二世在圣彼得堡登基",
      "美国影星约翰韦恩出生",
      "曼联足球俱乐部主帅马特巴斯比出生",
      "美国记者雅各布里斯逝世",
      "日本军将领白川义则逝世",
      "中国首次成功发射地对地中程导弹",
      "日本漫画家和月伸宏出生",
      "德国哲学家马丁海德格尔逝世",
      "京剧艺术家孟小冬逝世"
    ]
  }
  ```