class banner {
  final String title;
  final String imageUrl;
  final String linkUrl;
  final String logo;

  banner(this.title, this.imageUrl,this.linkUrl,this.logo);

  banner.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        linkUrl=json['linkUrl'],
        logo=json['logo'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'title': title,
        'linkUrl': linkUrl,
        'logo':logo,
        'imageUrl':imageUrl
      };
}