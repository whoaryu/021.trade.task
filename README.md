# Watchlist App

This app displays stock watchlists using `TabBar` and `TabBarView`. It loads stock data from a local JSON file and shows stock details in a scrollable list.

## Features
- Multiple watchlists with tab navigation.
- Fetches stock data from `assets/stocks.json`.
- Displays stock name, price, and change percentage.
- Loading indicator while fetching data.

## Components Used
- **`TabController`**: Manages tabs.
- **`TabBar & TabBarView`**: Enables tab navigation.
- **`DefaultAssetBundle`**: Loads JSON data.
- **`ListView.builder`**: Displays stocks.
- **`CircularProgressIndicator`**: Shows loading.

## JSON Structure
```json
{
  "Watchlist 1": [{"name": "Stock A", "price": "₹1000", "change": "+5%"}]
}
```

## Screenshots
