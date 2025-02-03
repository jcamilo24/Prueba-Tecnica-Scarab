part of co.com.countries.home;

class CountryModel {
  final String name;
  final String officialName;
  final String code;
  final String region;
  final String subregion;
  final String capital;
  final String flag;
  final String? fifa;
  final double area;
  final int population;
  final String googleMaps;
  final String currency;
  final String currencySymbol;
  final Map<String, String> languages;
  bool isChecked;

  CountryModel({
    required this.name,
    required this.officialName,
    required this.code,
    required this.region,
    required this.subregion,
    required this.capital,
    required this.flag,
    required this.fifa,
    required this.area,
    required this.population,
    required this.googleMaps,
    required this.currency,
    required this.currencySymbol,
    required this.languages,
    this.isChecked = false,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'],
      officialName: json['name']['official'],
      code: json['cca2'],
      region: json['region'],
      subregion: json['subregion'] ?? '',
      capital: (json['capital'] != null) ? json['capital'][0] : 'N/A',
      flag: json['flags']['png'],
      fifa: json['fifa'],
      area: json['area'].toDouble(),
      population: json['population'],
      googleMaps: json['maps']['googleMaps'],
      currency: json['currencies']?.entries.first.value['name'] ?? 'Unknown',
      currencySymbol: json['currencies']?.entries.first.value['symbol'] ?? '',
      languages: (json['languages'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {},
    );
  }
}
