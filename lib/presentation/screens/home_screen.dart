import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:la_vie/data/models/products.dart';
import 'package:la_vie/presentation/widgets/products_item.dart';
import 'package:la_vie/business_logic/cubit/products_cubit/products_cubit.dart';

import 'package:la_vie/data/models/seeds.dart';
import 'package:la_vie/presentation/widgets/seeds_item.dart';
import 'package:la_vie/business_logic/cubit/seeds_cubit/seeds_cubit.dart';

import 'package:la_vie/data/models/plants.dart';
import 'package:la_vie/presentation/widgets/plants_item.dart';
import 'package:la_vie/business_logic/cubit/plants_cubit/plants_cubit.dart';

import 'package:la_vie/data/models/tools.dart';
import 'package:la_vie/presentation/widgets/tools_item.dart';
import 'package:la_vie/business_logic/cubit/tools_cubit/tools_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late List<Seed> allSeeds = [];
  late List<Seed> searchedForSeeds;
  late List<Product> allProducts = [];
  late List<Product> searchedForProducts;
  late List<Plant> allPlants = [];
  late List<Plant> searchedForPlants;
  late List<Tool> allTools = [];
  late List<Tool> searchedForTools;
  late bool _isSearching = false;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final _searchTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SeedsCubit>(context).getAllSeeds();
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
    BlocProvider.of<PlantsCubit>(context).getAllPlants();
    BlocProvider.of<ToolsCubit>(context).getAllTools();
  }

  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 60.0,
        items: const [
          ImageIcon(
            AssetImage(
              'assets/icons/leaff.png',
            ),
          ),
          ImageIcon(
            AssetImage(
              'assets/icons/Scan.png',
            ),
          ),
          ImageIcon(
            AssetImage(
              'assets/icons/home.png',
            ),
          ),
          ImageIcon(
            AssetImage(
              'assets/icons/bell.png',
            ),
          ),
          ImageIcon(
            AssetImage(
              'assets/icons/Person.png',
            ),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Color.fromARGB(255, 243, 242, 242),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
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
                        onChanged: (searchedProduct) {
                          addSearchedForItemsToSearchedList(searchedProduct);
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
                height: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child: buildBlocProductsWidget(),
                    ),
                    Container(
                      child: buildBlocPlantsWidget(),
                    ),
                    Container(
                      child: buildBlocSeedsWidget(),
                    ),
                    Container(
                      child: buildBlocToolsWidget(),
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

  Widget buildBlocSeedsWidget() {
    return BlocBuilder<SeedsCubit, SeedsState>(
      builder: (context, state) {
        if (state is SeedsLoaded) {
          allSeeds = (state).seeds;
          return buildLoadedSeedsListWidgets();
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

  Widget buildLoadedSeedsListWidgets() {
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

  Widget buildBlocProductsWidget() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProducts = (state).products;
          return buildLoadedProductsListWidgets();
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

  Widget buildLoadedProductsListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildProductsList(),
          ],
        ),
      ),
    );
  }

  Widget buildProductsList() {
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
          ? allProducts.length
          : searchedForProducts.length,
      itemBuilder: (ctx, index) {
        return ProductItem(
          product: _searchTextController.text.isEmpty
              ? allProducts[index]
              : searchedForProducts[index],
        );
      },
    );
  }

  Widget buildBlocPlantsWidget() {
    return BlocBuilder<PlantsCubit, PlantsState>(
      builder: (context, state) {
        if (state is PlantsLoaded) {
          allPlants = (state).plants;
          return buildLoadedPlantsListWidgets();
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

  Widget buildLoadedPlantsListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildPlantsList(),
          ],
        ),
      ),
    );
  }

  Widget buildPlantsList() {
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
          ? allPlants.length
          : searchedForPlants.length,
      itemBuilder: (ctx, index) {
        return PlantItem(
          plant: _searchTextController.text.isEmpty
              ? allPlants[index]
              : searchedForPlants[index],
        );
      },
    );
  }

  Widget buildBlocToolsWidget() {
    return BlocBuilder<ToolsCubit, ToolsState>(
      builder: (context, state) {
        if (state is ToolsLoaded) {
          allTools = (state).tools;
          return buildLoadedToolsListWidgets();
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

  Widget buildLoadedToolsListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildToolsList(),
          ],
        ),
      ),
    );
  }

  Widget buildToolsList() {
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
          ? allTools.length
          : searchedForTools.length,
      itemBuilder: (ctx, index) {
        return ToolItem(
          tool: _searchTextController.text.isEmpty
              ? allTools[index]
              : searchedForTools[index],
        );
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedProduct) {
    searchedForProducts = allProducts
        .where((product) =>
            product.name!.toLowerCase().startsWith(searchedProduct))
        .toList();
    setState(() {});
  }
}
