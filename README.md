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


<img width="280" alt="ss1" src="https://github.com/user-attachments/assets/3b8ccbb6-9e6c-4a4a-a5c3-e585a99d9b89" />
<img width="280" alt="ss2" src="https://github.com/user-attachments/assets/f0b097b6-314a-43c6-ae49-b7ed8e23e600" />
<img width="280" alt="ss3" src="https://github.com/user-attachments/assets/26cb1409-a166-4b95-bd76-9f0ef171b240" />
