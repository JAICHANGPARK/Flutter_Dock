/**
 *
 *
 * public class RootObject
    {
    public string id { get; set; }
    public string name { get; set; }
    public string description { get; set; }
    public string url { get; set; }
    public string category { get; set; }
    public string language { get; set; }
    public string country { get; set; }
    }

 **/

class NewsAPI {
  final String status;
  final List<Source> sources;

  NewsAPI({this.status, this.sources});

  factory NewsAPI.fromJson(Map<String, dynamic> json) {
    return NewsAPI(
        status: json['status'],
        sources: (json['sources'] as List)
            .map((source) => Source.fromJson(source))
            .toList());
  }
}

class Source {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;

  final String country;

  Source(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        url: json['url'],
        category: json['category'],
        language: json['language'],
        country: json['country']);
  }
}
