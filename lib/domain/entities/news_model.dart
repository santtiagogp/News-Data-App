class News {
    final String title;
    final String link;
    final List<String> keywords;
    final List<String> creator;
    final dynamic videoUrl;
    final String description;
    final String content;
    final DateTime pubDate;
    final String imageUrl;
    final String sourceId;
    final List<String> country;
    final String language;
    bool saved;

    News({
        required this.title,
        required this.link,
        required this.keywords,
        required this.creator,
        required this.videoUrl,
        required this.description,
        required this.content,
        required this.pubDate,
        required this.imageUrl,
        required this.sourceId,
        required this.country,
        required this.language,
        this.saved = false
    });

}