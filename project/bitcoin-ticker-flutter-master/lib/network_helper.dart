import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper({this.baseURL, this.coin, this.currency});

  String baseURL;
  String coin;
  String currency;

  Future getData() async{

//    https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD
    http.Response response = await http.get(baseURL + coin + currency);

    if(response.statusCode == 200){
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }

  }

}
