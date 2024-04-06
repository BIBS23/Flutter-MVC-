
class Team {
  int? id;
  String? name;
  String? city;
  String? abbreviation;
  String? fullName;
  String? division;

  Team({
    this.id,
    this.city,
    this.abbreviation,
    this.fullName,
    this.division,
    this.name,
  });

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    abbreviation = json['abbreviation'];
    fullName = json['full_name'];
    division = json['division'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['city'] = city;
    data['abbreviation'] = abbreviation;
    data['full_name'] = fullName;
    data['division'] = division;
    data['name'] = name;
    return data;
  }
}
