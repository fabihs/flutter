import 'package:flutter/material.dart';
import 'package:tugas_aplikasi/komponen/data_genre.dart';

class MyCari extends StatelessWidget {
  const MyCari({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    int axis = 2;
    if (screenSize > 600) {
      axis = 3;
    }
    if (screenSize > 950) {
      axis = 4;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Find",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            Icon(
              Icons.connected_tv_outlined,
              color: Colors.blue,
              size: 35,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: MySearch(),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Genres",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: genres.length,
              padding: const EdgeInsets.only(top: 17, left: 12, right: 12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: axis,
                mainAxisExtent: 50,
                crossAxisSpacing: 15, //horizontal
                mainAxisSpacing: 15, //vertikal
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    genres[index].listGenre.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySearch extends StatefulWidget {
  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(22)),
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search by actor, title...',
              hintStyle: const TextStyle(color: Colors.white),
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () => _searchController.clear(),
              ),
              // Add a search icon or button to the search bar
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Perform the search here
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
