class Book {
  int _albumId;
  int _id;
  String _title;
  String _url;
  String _thumbnailUrl;
  bool _isSelected;

  Book({int albumId, int id, String title, String url, String thumbnailUrl}) {
    this._albumId = albumId;
    this._id = id;
    this._title = title;
    this._url = url;
    this._thumbnailUrl = thumbnailUrl;
    this._isSelected = false;
  }

  int get albumId => _albumId;
  set albumId(int albumId) => _albumId = albumId;

  int get id => _id;
  set id(int id) => _id = id;

  String get title => _title;
  set title(String title) => _title = title;

  String get url => _url;
  set url(String url) => _url = url;

  String get thumbnailUrl => _thumbnailUrl;
  set thumbnailUrl(String thumbnailUrl) => _thumbnailUrl = thumbnailUrl;

  bool get isSelected => _isSelected;
  set isSelected(bool isSelected) => _isSelected = isSelected;

  Book.fromJson(Map<String, dynamic> json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
    _isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this._albumId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['url'] = this._url;
    data['thumbnailUrl'] = this._thumbnailUrl;
    return data;
  }
}
