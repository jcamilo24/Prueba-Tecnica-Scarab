part of co.com.countries.home;

class CountriesTab extends StatefulWidget {
  final String region;

  const CountriesTab({super.key, required this.region});

  @override
  State<CountriesTab> createState() => _CountriesTabState();
}

class _CountriesTabState extends State<CountriesTab> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void didUpdateWidget(covariant CountriesTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.region != widget.region) {
      _fetchData();
    }
  }

  void _fetchData() {
    final countryViewModel =
        Provider.of<CountryViewModel>(context, listen: false);
    countryViewModel.getCountriesByRegion(widget.region);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryViewModel>(
      builder: (context, countryViewModel, child) {
        if (countryViewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (countryViewModel.errorMessage != null) {
          return Center(child: Text(countryViewModel.errorMessage!));
        }

        return SizedBox(
          height: 750,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: countryViewModel.countries.length,
              itemBuilder: (context, index) {
                final country = countryViewModel.countries[index];
                return CountryCard(
                  country: country,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
