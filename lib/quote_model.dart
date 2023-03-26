class QuoteModel {
  String? _sId;
  String? _content;
  String? _author;
  List<String>? _tags;
  String? _authorSlug;
  int? _length;
  String? _dateAdded;
  String? _dateModified;

  QuoteModel(
      {String? sId,
        String? content,
        String? author,
        List<String>? tags,
        String? authorSlug,
        int? length,
        String? dateAdded,
        String? dateModified}) {
    if (sId != null) {
      _sId = sId;
    }
    if (content != null) {
      _content = content;
    }
    if (author != null) {
      _author = author;
    }
    if (tags != null) {
      _tags = tags;
    }
    if (authorSlug != null) {
      _authorSlug = authorSlug;
    }
    if (length != null) {
      _length = length;
    }
    if (dateAdded != null) {
      _dateAdded = dateAdded;
    }
    if (dateModified != null) {
      _dateModified = dateModified;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get author => _author;
  set author(String? author) => _author = author;
  List<String>? get tags => _tags;
  set tags(List<String>? tags) => _tags = tags;
  String? get authorSlug => _authorSlug;
  set authorSlug(String? authorSlug) => _authorSlug = authorSlug;
  int? get length => _length;
  set length(int? length) => _length = length;
  String? get dateAdded => _dateAdded;
  set dateAdded(String? dateAdded) => _dateAdded = dateAdded;
  String? get dateModified => _dateModified;
  set dateModified(String? dateModified) => _dateModified = dateModified;

  QuoteModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _content = json['content'];
    _author = json['author'];
    _tags = json['tags'].cast<String>();
    _authorSlug = json['authorSlug'];
    _length = json['length'];
    _dateAdded = json['dateAdded'];
    _dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = _sId;
    data['content'] = _content;
    data['author'] = _author;
    data['tags'] = _tags;
    data['authorSlug'] = _authorSlug;
    data['length'] = _length;
    data['dateAdded'] = _dateAdded;
    data['dateModified'] = _dateModified;
    return data;
  }
}
