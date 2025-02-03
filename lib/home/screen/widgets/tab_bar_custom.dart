part of co.com.countries.home;

class TabBarCustom extends StatefulWidget {
  const TabBarCustom(
      {Key? key,
      required this.item1,
      required this.item2,
      required this.item3,
      required this.item4,
      required this.item5,
      required this.onTap})
      : super(key: key);
  final String item1;
  final String item2;
  final String item3;
  final String item4;
  final String item5;
  final Function(int index) onTap;

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0xFFE2E7F0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Center(
                  child: Text(
                widget.item1,
                style: TextStyle(color: Colors.blue.shade800),
              )),
            ),
            Tab(
              child: Center(
                  child: Text(
                widget.item2,
                style: TextStyle(color: Colors.blue.shade800),
              )),
            ),
            Tab(
              child: Center(
                  child: Text(
                widget.item3,
                style: TextStyle(color: Colors.blue.shade800),
              )),
            ),
            Tab(
              child: Center(
                  child: Text(
                widget.item4,
                style: TextStyle(color: Colors.blue.shade800),
              )),
            ),
            Tab(
              child: Center(
                  child: Text(
                widget.item5,
                style: TextStyle(color: Colors.blue.shade800),
              )),
            )
          ],
          labelColor: const Color(0xFF59408C),
          labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          labelStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.50,
          ),
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1C091E42),
                blurRadius: 2,
                offset: Offset(0, 0),
                spreadRadius: -1,
              ),
              BoxShadow(
                color: Color(0x16091E42),
                blurRadius: 5,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          dividerColor: const Color(0xFFE2E7F0),
          onTap: (index) => widget.onTap(index),
        ),
      ),
    );
  }
}
