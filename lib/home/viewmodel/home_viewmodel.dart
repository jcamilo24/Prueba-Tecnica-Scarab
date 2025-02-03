part of co.com.countries.home;

class CountryViewModel extends ChangeNotifier {
  final CountryService _countryService = CountryService();

  List<CountryModel> _countries = [];
  CountryModel? _selectedCountry;
  bool _isLoading = false;
  String? _errorMessage;
  int? _activeSubScreen = 0;
  Map<String, bool> countryCheckStates = {};
  List<CountryModel> selectedCountries = [];

  List<CountryModel> get countries => _countries;
  CountryModel? get selectedCountry => _selectedCountry;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int? get activeSubScreen => _activeSubScreen;

  Future<void> getCountriesByRegion(String region) async {
    final response = await CountryService.getCountriesByRegion(region);
    _isLoading = false;
    _countries = response.countries;
    _errorMessage = null;

    notifyListeners();
  }

  Future<void> fetchCountryByName(String name) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _selectedCountry = await CountryService.getCountryByCode(name);
    } catch (e) {
      _errorMessage = "Error al obtener el país: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSubScreen(int index) {
    _activeSubScreen = index;
    notifyListeners();
  }

  bool getCheckedState(String countryCode) {
    return countryCheckStates[countryCode] ?? false;
  }

  void setChecked(CountryModel country, bool value) {
    // Actualiza el estado del checkbox en el mapa
    countryCheckStates[country.code] = value;

    // Actualiza la lista de países seleccionados según el estado del checkbox
    if (value) {
      selectedCountries.add(country);
    } else {
      selectedCountries.remove(country);
    }

    notifyListeners();
  }

  double getMaxPopulation() {
    return selectedCountries
        .map((country) => country.population)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();
  }
}
