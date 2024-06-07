class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
  factory ArticleModel.fromJosn(josn) {
    return ArticleModel(
      image: josn['urlToImage'],
      title: josn['title'],
      subTitle: josn['description'],
    );
  }
}

class AModel {
  final String author;
  final String title;
  final String desc;
  final String url;
  final String urlImage;
  final String content;
  final Source source;

  AModel({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlImage,
    required this.content,
    required this.source,
  });
  factory AModel.fromJosn(josn) {
    return AModel(
      author: josn['author'],
      title: josn['title'],
      desc: josn['description'],
      url: josn['url'],
      urlImage: josn['urlToImage'],
      content: josn['content'],
      source: josn['source'],
    );
  }
}

class Source {
  final int id;
  final String name;

  Source({required this.id, required this.name});
  factory Source.fromJosn(josn) {
    return Source(
      id: josn['id'],
      name: josn['name'],
    );
  }
}
