import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String _baseUrl = 'https://rest.coinapi.io/v1/exchangerate/';
const String _apiKey = 'E22F76A0-8E01-4632-8B59-5D796947E981';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  int selectedCurrencyIndex = 0;

  String getSelectedCurrency() =>
      Platform.isIOS ? currenciesList[selectedCurrencyIndex] : currency;

  Timer _debouncer;

  Map<String, Map<String, double>> rates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Top: Cards
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList
                .map((crypto) =>
                    buildCard(crypto: crypto, currency: getSelectedCurrency()))
                .toList(),
          ),
          // Bottom: currency picker
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? CupertinoPicker(
                    itemExtent: 48,
                    backgroundColor: Colors.lightBlue,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedCurrencyIndex = index;
                      });
                      _onFetchExchange();
                    },
                    children: currenciesList
                        .map((currency) => Center(child: Text(currency)))
                        .toList(),
                  )
                : DropdownButton<String>(
                    value: currency,
                    items: currenciesList
                        .map(
                          (currency) => DropdownMenuItem(
                            value: currency,
                            child: Text(currency),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        currency = value;
                      });
                    }),
          ),
        ],
      ),
    );
  }

  Widget buildCard({@required String crypto, @required String currency}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $crypto = ${_getRateText(crypto: crypto, currency: currency)} $currency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  String _getRateText({@required crypto, @required currency}) {
    double rate = rates[crypto][currency];
    if (rate == null) {
      return "?";
    } else {
      return rate.toStringAsFixed(2) ?? '?';
    }
  }

  void _onFetchExchange() {
    if (_debouncer != null && _debouncer.isActive) _debouncer.cancel();

    _debouncer =
        Timer(const Duration(milliseconds: 1000), () => getExchangeRates());
  }

  void getExchangeRates() async {
    String currency = currenciesList[selectedCurrencyIndex];

    for (String crypto in cryptoList) {
      // Init the dictionary for this crypto
      if (rates[crypto] == null) {
        rates[crypto] = {};
      }

      // Fetch and store the exchange rate if needed
      if (rates[crypto][currency] == null) {
        Uri url = Uri.https(
          'rest.coinapi.io',
          'v1/exchangerate/BTC/' + currency,
          {'apiKey': _apiKey},
        );
        print(url);
        var response = await http.get(url);
        var responseObject = JsonDecoder().convert(response.body);
        setState(() {
          rates[crypto][currency] = responseObject['rate'] as double;
        });
      }
    }

    // Example response
    // {
    //  "time": "2022-09-12T10:02:34.0000000Z",
    //  "asset_id_base": "BTC",
    //  "asset_id_quote": "IDR",
    //  "rate": 325086765.01124144484680971144
    // }
  }

  @override
  void dispose() {
    if (_debouncer != null) _debouncer?.cancel();
    super.dispose();
  }
}
