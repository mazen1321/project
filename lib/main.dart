import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversion App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConversionButton(
              title: 'Convert Metric Units',
              nextPage: ConvertMetricPage(),
            ),
            SizedBox(height: 16.0),
            ConversionButton(
              title: 'Convert Mass Units',
              nextPage: ConvertMassPage(),
            ),
            SizedBox(height: 16.0),
            ConversionButton(
              title: 'Convert Temperature',
              nextPage: ConvertTemperaturePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class ConversionButton extends StatelessWidget {
  final String title;
  final Widget nextPage;

  const ConversionButton({
    required this.title,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Text(title),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ConvertMetricPage extends StatefulWidget {
  @override
  _ConvertMetricPageState createState() => _ConvertMetricPageState();
}

class _ConvertMetricPageState extends State<ConvertMetricPage> {
  String fromUnit = 'Meter';
  String toUnit = 'Centimeter';
  double inputValue = 0.0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Metric Units'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDropdownButton(
                'From Unit', ['Meter', 'Kilometer', 'Centimeter']),
            SizedBox(height: 16.0),
            _buildDropdownButton(
                'To Unit', ['Meter', 'Kilometer', 'Centimeter']),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Value',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _performConversion();
              },
              child: Text('Confirm'),
            ),
            SizedBox(height: 16.0),
            Text('Result: $result $toUnit'),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String label, List<String> items) {
    String selectedUnit;

    if (label == 'From Unit') {
      selectedUnit = fromUnit;
    } else {
      selectedUnit = toUnit;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedUnit,
          onChanged: (String? newValue) {
            setState(() {
              if (label == 'From Unit') {
                fromUnit = newValue!;
              } else {
                toUnit = newValue!;
              }
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  _performConversion() {
    double resultValue = inputValue;
    if (fromUnit == 'Meter' && toUnit == 'Centimeter') {
      resultValue = inputValue * 100.0;
    } else if (fromUnit == 'Meter' && toUnit == 'Kilometer') {
      resultValue = inputValue / 1000.0;
    } else if (fromUnit == 'Kilometer' && toUnit == 'Meter') {
      resultValue = inputValue * 1000.0;
    } else if (fromUnit == 'Kilometer' && toUnit == 'Centimeter') {
      resultValue = inputValue * 100000.0;
    } else if (fromUnit == 'Centimeter' && toUnit == 'Meter') {
      resultValue = inputValue / 100.0;
    } else if (fromUnit == 'Centimeter' && toUnit == 'Kilometer') {
      resultValue = inputValue / 100000.0;
    }

    setState(() {
      result = resultValue;
    });
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ConvertMassPage extends StatefulWidget {
  @override
  _ConvertMassPageState createState() => _ConvertMassPageState();
}

class _ConvertMassPageState extends State<ConvertMassPage> {
  String fromUnit = 'Milligram';
  String toUnit = 'Gram';
  double inputValue = 0.0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Mass Units'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDropdownButton(
                'From Unit', ['Milligram', 'Gram', 'Kilogram']),
            SizedBox(height: 16.0),
            _buildDropdownButton('To Unit', ['Milligram', 'Gram', 'Kilogram']),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Value',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _performConversion();
              },
              child: Text('Confirm'),
            ),
            SizedBox(height: 16.0),
            Text('Result: $result $toUnit'),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String label, List<String> items) {
    String selectedUnit;

    if (label == 'From Unit') {
      selectedUnit = fromUnit;
    } else {
      selectedUnit = toUnit;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedUnit,
          onChanged: (String? newValue) {
            setState(() {
              if (label == 'From Unit') {
                fromUnit = newValue!;
              } else {
                toUnit = newValue!;
              }
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  _performConversion() {
    double resultValue1 = inputValue;
    if (fromUnit == 'Milligram' && toUnit == 'Gram') {
      resultValue1 = inputValue / 1000.0;
    } else if (fromUnit == 'Milligram' && toUnit == 'Kilogram') {
      resultValue1 = inputValue / 1000000.0;
    } else if (fromUnit == 'Gram' && toUnit == 'Milligram') {
      resultValue1 = inputValue * 1000.0;
    } else if (fromUnit == 'Gram' && toUnit == 'Kilogram') {
      resultValue1 = inputValue / 1000.0;
    } else if (fromUnit == 'Kilogram' && toUnit == 'Milligram') {
      resultValue1 = inputValue * 1000000.0;
    } else if (fromUnit == 'Kilogram' && toUnit == 'Gram') {
      resultValue1 = inputValue * 1000.0;
    }

    setState(() {
      result = resultValue1;
    });
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
class ConvertTemperaturePage extends StatefulWidget {
  @override
  _ConvertTemperaturePageState createState() => _ConvertTemperaturePageState();
}

class _ConvertTemperaturePageState extends State<ConvertTemperaturePage> {
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  double inputValue = 0.0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Temperature'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDropdownButton('From Unit', ['Celsius', 'Fahrenheit']),
            SizedBox(height: 16.0),
            _buildDropdownButton('To Unit', ['Celsius', 'Fahrenheit']),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Value',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _performConversion();
              },
              child: Text('Confirm'),
            ),
            SizedBox(height: 16.0),
            Text('Result: $result $toUnit'),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String label, List<String> items) {
    String selectedUnit;

    if (label == 'From Unit') {
      selectedUnit = fromUnit;
    } else {
      selectedUnit = toUnit;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedUnit,
          onChanged: (String? newValue) {
            setState(() {
              if (label == 'From Unit') {
                fromUnit = newValue!;
              } else {
                toUnit = newValue!;
              }
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  _performConversion() {
    double resultValue2 = inputValue;
    if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
      resultValue2 = (inputValue * 9 / 5) + 32;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
      resultValue2 = (inputValue - 32) * 5 / 9;
    }

    setState(() {
      result = resultValue2;
    });
  }
}
