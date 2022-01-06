import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({Key? key}) : super(key: key);

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  final List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  final List<DropdownMenuItem<String>> _dropdownMenuItems =
      List.empty(growable: true);
  String? _buttonText;

  String result = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropdownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Widget Example'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('결과: $result', style: const TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  keyboardType: TextInputType.number, controller: value1),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  keyboardType: TextInputType.number, controller: value2),
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(
                    items: _dropdownMenuItems,
                    onChanged: (String? value) {
                      setState(() {
                        _buttonText = value;
                      });
                    },
                    value: _buttonText)),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                child: Row(children: <Widget>[
                  const Icon(Icons.add),
                  Text(_buttonText!)
                ]),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                onPressed: () => {
                  setState(() {
                    int first = int.parse(value1.value.text);
                    int second = int.parse(value2.value.text);
                    switch (_buttonText) {
                      case '더하기':
                        result = '${first + second}';
                        break;
                      case '빼기':
                        result = '${first - second}';
                        break;
                      case '곱하기':
                        result = '${first * second}';
                        break;
                      case '나누기':
                        result = '${first / second}';
                        break;
                    }
                  })
                },
              ),
            )
          ],
        )));
  }
}
