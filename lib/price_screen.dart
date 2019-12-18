import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedProp = null;
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
    getDropdownItems();
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
                  '1 BTC = ? USD',
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
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32,
              onSelectedItemChanged: (id){

              },
              children: getDropdownItems(),
            ),
          ),
        ],
      ),
    );
  }
}

/*
DropdownButton<String>(
              value: selectedProp,
              items: getDropdownItems(),
              onChanged: (v){
                setState(() {
                  selectedProp = v;
                });
              },
            ) */