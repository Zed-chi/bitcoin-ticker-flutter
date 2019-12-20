import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;


class PriceScreen extends StatefulWidget {
  
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  final dynamic json = CoinData().getCoinData();
  int getValue(cur){
    return json[cur];
  }

  String selectedProp = null;

  Widget getPicker(){
    if(Platform.isAndroid){
      return getDropdownPicker();
    } else if(Platform.isIOS){
      return getIOSPicker();
    }
  }

  DropdownButton<String> getDropdownPicker(){
    return DropdownButton<String>(
      value: selectedProp,
      items: getDropdownItems(),
      onChanged: (v){
        setState(() {
          selectedProp = v;
        });
      },
    );
  }

  CupertinoPicker getIOSPicker(){
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (id){

      },
      children: getTextItems(),
    );
  }

  List getTextItems(){
    List<String> dropList = [];
    for(int i=0;i< currenciesList.length; i++ ){
      String cur = currenciesList[i];
      dropList.add(cur);
    }
    return dropList;
  }

  List<DropdownMenuItem<String>> getDropdownItems(){
    List<DropdownMenuItem<String>> dropList = [];
    for(int i=0;i< currenciesList.length; i++ ){
      String cur = currenciesList[i];
      var item = DropdownMenuItem(
        child: Text(cur),
        value: cur,
      );
      dropList.add(item);
    }
    return dropList;
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${getValue(selectedProp)} USD',
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
      ),
    );
  }
}