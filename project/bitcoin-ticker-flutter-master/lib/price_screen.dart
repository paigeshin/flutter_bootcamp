import 'package:bitcoin_ticker/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

import 'coin_data.dart'; // import 관련 키워드,
// show.. 'relevant part'만 가져와라
// hide.. 특정 part만 가져오지 마라
// as.. 특정 이름으로 가져와라

const baseURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  double btcPrice;
  double ltcPrice;
  double ethPrice;

  //Android
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (currency) async {
        NetworkHelper btcHelper = new NetworkHelper(
            baseURL: baseURL, coin: cryptoList[0], currency: currency);
        NetworkHelper ltcHelper = new NetworkHelper(
            baseURL: baseURL, coin: cryptoList[1], currency: currency);
        NetworkHelper ethHelper = new NetworkHelper(
            baseURL: baseURL, coin: cryptoList[2], currency: currency);
        selectedCurrency = currency;
        var btcData = await btcHelper.getData();
        var ltcData = await ltcHelper.getData();
        var ethData = await ethHelper.getData();
        setState(() {
          if (btcData == null || ltcHelper == null || ethHelper == null) {
            btcPrice = 0;
            ltcPrice = 0;
            ethPrice = 0;
            return;
          }
          btcPrice = btcData['bid'];
          ltcPrice = ltcData['bid'];
          ethPrice = ethData['bid'];
        });
      },
    );
  }

  //IOS
  CupertinoPicker iOSPicker() {
    List<Text> currencies = [];
    for (String currency in currenciesList) {
      currencies.add(
        Text(
          currency,
          textAlign: TextAlign.center,
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selectedIndex) async {
        NetworkHelper btcHelper = new NetworkHelper(
            baseURL: baseURL, coin: cryptoList[0], currency: currencies[selectedIndex].data);
        NetworkHelper ltcHelper = new NetworkHelper(
            baseURL: baseURL, coin: cryptoList[1], currency: currencies[selectedIndex].data);
        NetworkHelper ethHelper = new NetworkHelper(
            baseURL: baseURL, coin: cryptoList[2], currency: currencies[selectedIndex].data);
        selectedCurrency = currencies[selectedIndex].data;
        var btcData = await btcHelper.getData();
        var ltcData = await ltcHelper.getData();
        var ethData = await ethHelper.getData();
        setState(() {
          if (btcData == null || ltcHelper == null || ethHelper == null) {
            btcPrice = 0;
            ltcPrice = 0;
            ethPrice = 0;
            return;
          }
          btcPrice = btcData['bid'];
          ltcPrice = ltcData['bid'];
          ethPrice = ethData['bid'];
        });
      },
      children: currencies,
    );
  }

  //**이 부분
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropDown();
    }
  }

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
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 BTC = $btcPrice $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 LTC = $ltcPrice $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 ETH = $ethPrice $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: getPicker(),
            ),
          ],
        ));
  }
}
