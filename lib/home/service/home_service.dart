part of co.com.countries.home;

class CountryService {
  static const String _baseUrl = 'https://restcountries.com/v3.1';

  static Future<RegionModel> getCountriesByRegion(String region) async {
    final response = await http.get(Uri.parse('$_baseUrl/region/$region'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<CountryModel> countries =
          jsonData.map((e) => CountryModel.fromJson(e)).toList();
      return RegionModel(region: region, countries: countries);
    } else {
      throw Exception('Error al obtener países de la región $region');
    }
  }

  static Future<CountryModel> getCountryByCode(String country) async {
    final response = await http.get(Uri.parse('$_baseUrl/name/$country'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return CountryModel.fromJson(jsonData[0]);
    } else {
      throw Exception('Error al obtener detalles del país con código $country');
    }
  }
}
