import 'dart:convert';
import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> watchlists = ["Watchlist 1", "Watchlist 2", "Watchlist 3", "Watchlist 4", "Watchlist 5"];
  Map<String, List<dynamic>> stockData = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: watchlists.length, vsync: this);
    _loadStockData();
  }

  Future<void> _loadStockData() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/stocks.json");
    Map<String, dynamic> jsonData = json.decode(jsonString);

    setState(() {
      for (var watchlist in watchlists) {
        stockData[watchlist] = jsonData[watchlist] ?? [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watchlist", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, 
              child: TabBar(
                controller: _tabController,
                isScrollable: true, 
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: watchlists.map((title) => Tab(text: title)).toList(),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(), 
        children: watchlists.map((watchlist) => _buildStockList(watchlist)).toList(),
      ),
    );
  }

  Widget _buildStockList(String watchlist) {
    List<dynamic> stocks = stockData[watchlist] ?? [];

    return stocks.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              var stock = stocks[index];
              bool isPositive = stock["change"].toString().contains("+");
              return ListTile(
                title: Text(
                  stock["name"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("NSE | EQ"),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      stock["price"],
                      style: TextStyle(
                        color: isPositive ? Colors.green : Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      stock["change"],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
