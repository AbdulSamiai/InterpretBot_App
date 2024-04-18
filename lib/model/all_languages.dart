class AllLanguages {
  int? id;
  String? languageName;

  AllLanguages({this.id, this.languageName});

  AllLanguages.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    languageName = json['LanguageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['LanguageName'] = languageName;
    return data;
  }
}
