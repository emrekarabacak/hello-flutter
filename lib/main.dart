import 'package:flutter/material.dart';
//import './ui/home.dart';

void main() => runApp(new MaterialApp(
      title: "Simpe App",
      //home: Home() //older course app
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trip Cost Calculator",
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String name = "";

  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String result = "";
  final double _formDistance = 5.0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(title: Text("Hello"), backgroundColor: Colors.blueAccent),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: distanceController,
                    decoration: InputDecoration(
                        hintText: 'e.g 124',
                        labelStyle: textStyle,
                        labelText: 'Distance',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number)),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: avgController,
                    decoration: InputDecoration(
                        hintText: 'e.g 17',
                        labelStyle: textStyle,
                        labelText: 'Distance Per Unit',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number)),
            Padding(
              padding:
                  EdgeInsets.only(top: _formDistance, bottom: _formDistance),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          controller: priceController,
                          decoration: InputDecoration(
                              hintText: 'e.g 1.65',
                              labelStyle: textStyle,
                              labelText: 'Price',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          keyboardType: TextInputType.number)),
                  Container(
                    width: _formDistance * 5,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _currency,
                    onChanged: (String value) {
                      _onDropdownChanged(value);
                    },
                  ))
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: Text('Submit', textScaleFactor: 1.5),
                  onPressed: () {
                    setState(() {
                      result = _calculate();
                    });
                  },
                )),
                Expanded(
                    child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  child: Text('Reset', textScaleFactor: 1.5),
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                )),
              ],
            ),
            Text(result),
          ],
        ),
      ),
    );
  }

  _onDropdownChanged(String value) {
    setState(() {
      _currency = value;
    });
  }

  _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;

    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }
}

// Codes from section 4 Hello You Demo
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hello You",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new HelloYou(),
    );
  }
}

class HelloYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  String name = "";

  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello"), backgroundColor: Colors.blueAccent),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Please insert your name'),
              onSubmitted: (String _name) {
                setState(() {
                  name = _name;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _currency,
              onChanged: (String value) {
                _onDropdownChanged(value);
              },
            ),
            Text('Hello ' + name + ''),
          ],
        ),
      ),
    );
  }

  _onDropdownChanged(String value) {
    setState(() {
      _currency = value;
    });
  }
}
*/
