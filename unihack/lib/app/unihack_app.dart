import 'package:flutter/material.dart';
//import 'package:unihack/ui/home/home_page.dart';


/*class UnihackApp extends StatelessWidget {
  const UnihackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

class UnihackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




/*class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;
  int selectedIndex = -1;
  int selectedSubItemIndex = -1;
  int selectedSubGroupIndex = -1;
  int selectedGroupIndex = -1;
  bool showSubItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: Row(
            children: [
              SearchBar(),
              const Spacer(),
              const Text(
                'Menu Header',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Main Content'),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: isMenuOpen ? 0 : -MediaQuery.of(context).size.height * 0.7,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Menu Header',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMenuItem('Buses', 'assets/images/bus_icon.png', 0),
                        _buildMenuItem('Hours', 'assets/images/time-icon.png', 1),
                        _buildMenuItem('Places', 'assets/images/tree-icon.png', 2),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.black),
                  if (showSubItems)
                    if(selectedGroupIndex == 0)
                      Column(  
                        children: [
                          _buildSubItemsRow(['33', '40', 'E1'], 'Bus', 1),
                          _buildSubItemsRow(['2', '7', '9'], 'Tram', 2),
                          _buildSubItemsRow(['11', '14', '17'], 'Trolley', 3),
                        ],
                      ),
                    if(selectedGroupIndex == 1)
                      Column(
                        children: [
                          _buildSubItemsRow(['Bus', 'Tramv', "Trolley"], 'Transport' ,4),
                        ],
                      ),
                  const Expanded(
                    child: Center(
                      child: Text('Choose an option'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
          child: Icon(isMenuOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }*/






class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;
  bool isDrawerOpen = false; // Track the state of the drawer
  int selectedIndex = -1;
  int selectedSubItemIndex = -1;
  int selectedSubGroupIndex = -1;
  int selectedGroupIndex = -1;
  bool showSubItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: Row(
            children: [
              SearchBar(),
              const Spacer(),
              const Text(
                'Menu Header',
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() {
                    isDrawerOpen = !isDrawerOpen;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Main Content'),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: isMenuOpen ? 0 : -MediaQuery.of(context).size.height * 0.7,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Menu Header',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMenuItem('Buses', 'assets/images/bus_icon.png', 0),
                        _buildMenuItem('Hours', 'assets/images/time-icon.png', 1),
                        _buildMenuItem('Places', 'assets/images/tree-icon.png', 2),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.black),
                  if (showSubItems)
                    if(selectedGroupIndex == 0)
                      Column(  
                        children: [
                          _buildSubItemsRow(['33', '40', 'E1'], 'Bus', 1),
                          _buildSubItemsRow(['2', '7', '9'], 'Tram', 2),
                          _buildSubItemsRow(['11', '14', '17'], 'Trolley', 3),
                        ],
                      ),
                    if(selectedGroupIndex == 1)
                      Column(
                        children: [
                          _buildSubItemsRow(['Bus', 'Tramv', "Trolley"], 'Transport' ,4),
                        ],
                      ),
                  const Expanded(
                    child: Center(
                      child: Text('Choose an option'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*if (isDrawerOpen)
            Container(
              width: 300, // Set the width of the drawer according to your needs
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Setting 1'),
                      onTap: () {
                        // Handle the tap on Setting 1
                      },
                    ),
                    ListTile(
                      title: const Text('Setting 2'),
                      onTap: () {
                        // Handle the tap on Setting 2
                      },
                    ),
                    // Add more settings as needed
                  ],
                ),
              ),
            ),*/
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
          child: Icon(isMenuOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }



  Widget _buildMenuItem(String title, String imagePath, int index) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGroupIndex = index;
          selectedSubGroupIndex = index;
          selectedSubItemIndex = -1;
          selectedIndex = index;
          showSubItems = title == 'Buses'; // Show sub items only for 'Buses'
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: isSelected ? Colors.cyan : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubItemsRow(List<String> subItems, String subtitle, int groupId) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          subtitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int k=0;k<subItems.length;k++) _buildSubItem(subItems[k], k+1, groupId),
          ],
        ),
      ),
    ],
  );
}

  Widget _buildSubItem(String title, int index, int groupIndex) {
    bool isSelected = ((index == selectedSubItemIndex) && (groupIndex==selectedSubGroupIndex));
    //print("Index, selIndex, grIndex, selGrIndex $index, $selectedSubItemIndex, $groupIndex, $selectedGroupIndex, -> $isSelected");
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSubItemIndex = index;
          selectedSubGroupIndex = groupIndex;
          if(selectedGroupIndex == 0)
            isMenuOpen = false;
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isSelected? Colors.cyan : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          // Show a search box when the user taps on the search bar
          showSearch(
            context: context,
            delegate: BusLineSearchDelegate(
              ['Bus Line 33', 'Bus Line 40', 'Bus Line E1', 'Tram 2', 'Tram 7', 'Tram 9', 'Trolley 11', 'Trolley 14', 'Trolley17']
              ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.search,
            size: 24.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class BusLineSearchDelegate extends SearchDelegate<String> {
  final List<String> busLines;

  BusLineSearchDelegate(this.busLines);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> filteredList = busLines
        .where((line) => line.toLowerCase().contains(query.toLowerCase()))
        .toList();
    filteredList.sort();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredList[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BusLineDetailsPage(
                  index: busLines.indexOf(filteredList[index]),
                  busLine: filteredList[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}




class BusLineDetailsPage extends StatelessWidget {
  final int index;
  final String busLine;

  BusLineDetailsPage({required this.index, required this.busLine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Line $index Details'),
      ),
      body: Center(
        child: Text('Details about $busLine'),
      ),
    );
  }
}