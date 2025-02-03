part of co.com.countries.home;

class ComparisonScreen extends StatelessWidget {
  final List<CountryModel> countries;

  const ComparisonScreen({
    super.key,
    required this.countries,
  });

  @override
  Widget build(BuildContext context) {
    final countryViewModel = Provider.of<CountryViewModel>(context);
    final selectedCountries = countryViewModel.selectedCountries;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comparar Poblaciones',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: selectedCountries.isEmpty
            ? const Center(child: Text('No se han seleccionado países'))
            : BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: countryViewModel.getMaxPopulation(),
                  barGroups: selectedCountries
                      .map((country) => BarChartGroupData(
                            x: selectedCountries.indexOf(country),
                            barRods: [
                              BarChartRodData(
                                toY: country.population.toDouble(),
                                color: Colors.blue,
                                width: 15,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ],
                          ))
                      .toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value % 1000000 == 0) {
                            return Text('${value ~/ 1000000}M');
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value < selectedCountries.length) {
                            return Text(selectedCountries[value.toInt()].name);
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
