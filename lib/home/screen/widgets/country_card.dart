part of co.com.countries.home;

class CountryCard extends StatelessWidget {
  final CountryModel country;
  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final countryViewModel = Provider.of<CountryViewModel>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: Image.network(country.flag),
            title: Text(country.name),
            onTap: () {
              _onCountryTap(context, country);
            },
            trailing: Checkbox(
              activeColor: Colors.blue.shade800,
              value: countryViewModel.getCheckedState(country.code),
              onChanged: (bool? value) {
                countryViewModel.setChecked(country, value ?? false);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Container(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFCBD4E1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onCountryTap(BuildContext context, CountryModel country) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CountryDetailScreen(country: country)),
    );
  }
}
