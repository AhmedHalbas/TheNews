class Article {
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Article({this.title, this.url, this.urlToImage, this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}
