part of co.com.countries.home;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final countryViewModel = Provider.of<CountryViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBarCustom(
              item1: "Americas",
              item2: "Asia",
              item3: "Europe",
              item4: "Oceania",
              item5: "Africa",
              onTap: (index) {
                countryViewModel.setSubScreen(index);
              }),
          const SizedBox(height: 10),
          changeSubScreen(countryViewModel),
        ],
      ),
      floatingActionButton: Container(
        width: 100,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComparisonScreen(
                  countries: countryViewModel.selectedCountries,
                ),
              ),
            );
          },
          backgroundColor: Colors.blue.shade800,
          child: const Text(
            'Comparar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16, // Tamaño del texto
            ),
          ),
        ),
      ),
    );
  }
}

Widget changeSubScreen(CountryViewModel provider) {
  int index = provider.activeSubScreen ?? 0;
  String region;
  switch (index) {
    case 1:
      region = 'asia';
      break;
    case 2:
      region = 'europe';
      break;
    case 3:
      region = 'oceania';
      break;
    case 4:
      region = 'africa';
      break;
    default:
      region = 'americas';
  }
  return CountriesTab(region: region);
}
