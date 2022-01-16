class Hits {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  int? previewWidth;
  int? previewHeight;
  String? webformatURL;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageURL;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageURL;


  Hits(
      this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.collections,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL);

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['pageURL'] = pageURL;
    data['type'] = type;
    data['tags'] = tags;
    data['previewURL'] = previewURL;
    data['previewWidth'] = previewWidth;
    data['previewHeight'] = previewHeight;
    data['webformatURL'] = webformatURL;
    data['webformatWidth'] = webformatWidth;
    data['webformatHeight'] = webformatHeight;
    data['largeImageURL'] = largeImageURL;
    data['imageWidth'] = imageWidth;
    data['imageHeight'] = imageHeight;
    data['imageSize'] = imageSize;
    data['views'] = views;
    data['downloads'] = downloads;
    data['collections'] = collections;
    data['likes'] = likes;
    data['comments'] = comments;
    data['user_id'] = userId;
    data['user'] = user;
    data['userImageURL'] = userImageURL;
    return data;
  }
}