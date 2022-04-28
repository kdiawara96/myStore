class ArticleList {
  int? id;
  int? categoryId;
  String? title;
  String? description;
  int? price;
  ImagesUrl? imagesUrl;
  String? creationDate;
  bool? isUrgent;

  ArticleList(
      {this.id,
      this.categoryId,
      this.title,
      this.description,
      this.price,
      this.imagesUrl,
      this.creationDate,
      this.isUrgent});

  ArticleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imagesUrl = json['images_url'] != null
        ? ImagesUrl.fromJson(json['images_url'])
        : null;
    creationDate = json['creation_date'];
    isUrgent = json['is_urgent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    if (imagesUrl != null) {
      data['images_url'] = imagesUrl?.toJson();
    }
    data['creation_date'] = creationDate;
    data['is_urgent'] = isUrgent;
    return data;
  }
}

class ImagesUrl {
  String? small;
  String? thumb;

  ImagesUrl({this.small, this.thumb});

  ImagesUrl.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['small'] = small;
    data['thumb'] = thumb;
    return data;
  }
}
