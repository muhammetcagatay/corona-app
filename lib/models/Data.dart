import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.global,
    this.countries,
    this.date,
  });

  Global global;
  List<Country> countries;
  DateTime date;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        global: json["Global"] == null ? null : Global.fromJson(json["Global"]),
        countries: json["Countries"] == null
            ? null
            : List<Country>.from(
                json["Countries"].map((x) => Country.fromJson(x))),
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Global": global == null ? null : global.toJson(),
        "Countries": countries == null
            ? null
            : List<dynamic>.from(countries.map((x) => x.toJson())),
        "Date": date == null ? null : date.toIso8601String(),
      };
}

class Country {
  Country({
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  });

  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: json["Country"] == null ? null : json["Country"],
        countryCode: json["CountryCode"] == null ? null : json["CountryCode"],
        slug: json["Slug"] == null ? null : json["Slug"],
        newConfirmed:
            json["NewConfirmed"] == null ? null : json["NewConfirmed"],
        totalConfirmed:
            json["TotalConfirmed"] == null ? null : json["TotalConfirmed"],
        newDeaths: json["NewDeaths"] == null ? null : json["NewDeaths"],
        totalDeaths: json["TotalDeaths"] == null ? null : json["TotalDeaths"],
        newRecovered:
            json["NewRecovered"] == null ? null : json["NewRecovered"],
        totalRecovered:
            json["TotalRecovered"] == null ? null : json["TotalRecovered"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Country": country == null ? null : country,
        "CountryCode": countryCode == null ? null : countryCode,
        "Slug": slug == null ? null : slug,
        "NewConfirmed": newConfirmed == null ? null : newConfirmed,
        "TotalConfirmed": totalConfirmed == null ? null : totalConfirmed,
        "NewDeaths": newDeaths == null ? null : newDeaths,
        "TotalDeaths": totalDeaths == null ? null : totalDeaths,
        "NewRecovered": newRecovered == null ? null : newRecovered,
        "TotalRecovered": totalRecovered == null ? null : totalRecovered,
        "Date": date == null ? null : date.toIso8601String(),
      };
}

class Global {
  Global({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  });

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  factory Global.fromJson(Map<String, dynamic> json) => Global(
        newConfirmed:
            json["NewConfirmed"] == null ? null : json["NewConfirmed"],
        totalConfirmed:
            json["TotalConfirmed"] == null ? null : json["TotalConfirmed"],
        newDeaths: json["NewDeaths"] == null ? null : json["NewDeaths"],
        totalDeaths: json["TotalDeaths"] == null ? null : json["TotalDeaths"],
        newRecovered:
            json["NewRecovered"] == null ? null : json["NewRecovered"],
        totalRecovered:
            json["TotalRecovered"] == null ? null : json["TotalRecovered"],
      );

  Map<String, dynamic> toJson() => {
        "NewConfirmed": newConfirmed == null ? null : newConfirmed,
        "TotalConfirmed": totalConfirmed == null ? null : totalConfirmed,
        "NewDeaths": newDeaths == null ? null : newDeaths,
        "TotalDeaths": totalDeaths == null ? null : totalDeaths,
        "NewRecovered": newRecovered == null ? null : newRecovered,
        "TotalRecovered": totalRecovered == null ? null : totalRecovered,
      };
}
