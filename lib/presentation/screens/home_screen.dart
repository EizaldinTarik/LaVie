import 'package:flutter/material.dart';
import 'package:la_vie/data/models/seeds.dart';
import 'package:la_vie/presentation/widgets/seeds_item.dart';
import 'package:la_vie/business_logic/cubit/seeds_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late List<Seed> allSeeds;
//   late List<Seed> searchedForSeeds;
//   late bool _isSearching = false;
//   final _searchTextController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<SeedsCubit>(context).getAllSeeds();
//   }

//   Widget _buildSearchField() {
//     return TextField(
//       controller: _searchTextController,
//       cursorColor: Colors.grey,
//       decoration: const InputDecoration(
//         hintText: 'Find a character',
//         border: InputBorder.none,
//         hintStyle: TextStyle(
//           color: Colors.grey,
//           fontSize: 18,
//         ),
//       ),
//       style: const TextStyle(
//         color: Colors.grey,
//         fontSize: 18,
//       ),
//       onChanged: (searchedSeed) {
//         addSearchedForItemsToSearchedList(searchedSeed);
//       },
//     );
//   }

// void addSearchedForItemsToSearchedList(String searchedSeed) {
//   searchedForSeeds = allSeeds
//       .where((seed) => seed.name.toLowerCase().startsWith(searchedSeed))
//       .toList();
//   setState(() {});
// }

//   List<Widget> _buildAppBarAction() {
//     if (_isSearching) {
//       return [
//         IconButton(
//           onPressed: () {
//             _clearSearch();
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.clear,
//             color: Colors.grey,
//           ),
//         ),
//       ];
//     } else {
//       return [
//         IconButton(
//           onPressed: _startSearch,
//           icon: const Icon(
//             Icons.search,
//             color: Colors.grey,
//           ),
//         ),
//       ];
//     }
//   }

//   void _startSearch() {
//     ModalRoute.of(context)!.addLocalHistoryEntry(
//       LocalHistoryEntry(
//         onRemove: _stopSearching,
//       ),
//     );
//     setState(() {
//       _isSearching = true;
//     });
//   }

//   void _stopSearching() {
//     _clearSearch();
//     setState(() {
//       _isSearching = false;
//     });
//   }

//   void _clearSearch() {
//     setState(() {
//       _searchTextController.clear();
//     });
//   }

//   Widget buildBlocWidget() {
//     return BlocBuilder<SeedsCubit, SeedsState>(
//       builder: (context, state) {
//         if (state is SeedsLoaded) {
//           allSeeds = (state).seeds;
//           return buildLoadedListWidgets();
//         } else {
//           return Container(
//             color: Colors.yellow,
//             child: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }

//   Widget buildLoadedListWidgets() {
//     return SingleChildScrollView(
//       child: Container(
//         color: Colors.grey,
//         child: Column(
//           children: [
//             buildSeedsList(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSeedsList() {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 2 / 3,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 1),
//       shrinkWrap: true,
//       physics: const ClampingScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: _searchTextController.text.isEmpty
//           ? allSeeds.length
//           : searchedForSeeds.length,
//       itemBuilder: (ctx, index) {
//         return SeedItem(
//           seed: _searchTextController.text.isEmpty
//               ? allSeeds[index]
//               : searchedForSeeds[index],
//         );
//       },
//     );
//   }

//   Widget _buildAppBarTitle() {
//     return const Text(
//       'Seeds',
//       style: TextStyle(
//         color: Colors.grey,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         leading: _isSearching
//             ? const BackButton(
//                 color: Colors.grey,
//               )
//             : Container(),
//         title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
//         actions: _buildAppBarAction(),
//       ),
//       backgroundColor: Colors.white,
//       body: buildBlocWidget(),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late List<Seed> allSeeds = [];
  late List<Seed> searchedForSeeds;
  late bool _isSearching = false;
  final _searchTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SeedsCubit>(context).getAllSeeds();
  }

  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/splash.png',
                scale: 4,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _searchTextController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: const Color.fromARGB(255, 248, 248, 248),
                          labelText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                        onChanged: (searchedSeed) {
                          addSearchedForItemsToSearchedList(searchedSeed);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/Rectangle.png',
                          scale: 3,
                        ),
                        Positioned(
                          left: 15,
                          top: 10,
                          child: Image.asset(
                            'assets/images/Cart.png',
                            scale: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    shape: BoxShape.circle,
                  ),
                  unselectedLabelColor: Color.fromARGB(255, 138, 138, 138),
                  labelColor: Color.fromARGB(255, 26, 188, 0),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Text(
                      'All',
                    ),
                    Text(
                      "Plants",
                    ),
                    Text(
                      "Seeds",
                    ),
                    Text(
                      "Tools",
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child: Text('All'),
                    ),
                    Container(
                      child: Text('Plants'),
                    ),
                    Container(
                      child: buildBlocWidget(),
                    ),
                    Container(
                      child: Text('Tools'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<SeedsCubit, SeedsState>(
      builder: (context, state) {
        if (state is SeedsLoaded) {
          allSeeds = (state).seeds;
          return buildLoadedListWidgets();
        } else {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildSeedsList(),
          ],
        ),
      ),
    );
  }

  Widget buildSeedsList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allSeeds.length
          : searchedForSeeds.length,
      itemBuilder: (ctx, index) {
        return SeedItem(
          seed: _searchTextController.text.isEmpty
              ? allSeeds[index]
              : searchedForSeeds[index],
        );
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedSeed) {
    searchedForSeeds = allSeeds
        .where((seed) => seed.name!.toLowerCase().startsWith(searchedSeed))
        .toList();
    //setState(() {});
  }
}
