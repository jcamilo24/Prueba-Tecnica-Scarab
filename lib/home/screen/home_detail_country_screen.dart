part of co.com.countries.home;

class CountryDetailScreen extends StatelessWidget {
  final CountryModel country;

  const CountryDetailScreen({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    const Map<String, String> languageMap = {
      'spa': 'Español',
      'eng': 'Inglés',
      'fra': 'Francés',
      'deu': 'Alemán',
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          'Detalles',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text('Nombre Oficial: ' + country.name),
            const SizedBox(height: 10),
            Image.network(country.flag),
            const SizedBox(height: 10),
            Text('Capital: ${country.capital}'),
            Text('Población: ${country.population}'),
            Text(
              'Idioma: ${country.languages.keys.map((key) => languageMap[key] ?? key).join(', ')}',
            ),
            Text(
                'Moneda: ${country.currency} (${country.fifa ?? country.currencySymbol})'),
            // Agrega más detalles si lo deseas...
          ],
        ),
      ),
    );
  }
}
