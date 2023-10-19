class JobDto {
  int id;
  String upWorkId;
  String link;
  String country;
  dynamic priorityCountry;
  bool isForbidden;
  DateTime createdOn;
  dynamic categoryId;
  String title;
  String description;

  JobDto({
    required this.id,
    required this.upWorkId,
    required this.link,
    required this.country,
    required this.priorityCountry,
    required this.isForbidden,
    required this.createdOn,
    required this.categoryId,
    required this.title,
    required this.description,
  });

  JobDto.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        upWorkId = json['upWorkId'].toString(),
        link = json['link'].toString(),
        country = json['country'].toString(),
        priorityCountry = json['priorityCountry'],
        isForbidden = json['isForbidden'] as bool,
        createdOn = DateTime.parse(json['createdOn'].toString()),
        categoryId = json['categoryId'],
        title = json['title'].toString(),
        description = json['description'].toString();
}
