class News {
    final String title;
    final String link;
    final List<String>? keywords;
    final List<String>? creator;
    final dynamic videoUrl;
    final String description;
    final String content;
    final DateTime pubDate;
    final String? imageUrl;
    final String sourceId;
    final List<String> country;
    final String language;

    News({
        required this.title,
        required this.link,
        this.keywords,
        this.creator,
        this.videoUrl,
        required this.description,
        required this.content,
        required this.pubDate,
        this.imageUrl,
        required this.sourceId,
        required this.country,
        required this.language,
    });

}