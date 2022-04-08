import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Editable example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();
  bool whichRows = true;

  List<Map<String, String>> rows = [
    {
      "name": 'James LongName Joe',
      "date": '23/09/2020',
      "month": 'June',
      "status": 'completed'
    },
    {
      "name": 'Daniel Paul',
      "month": 'March',
      "status": 'new',
      "date": '12/4/2020',
    },
    {
      "month": 'May',
      "name": 'Mark Zuckerberg',
      "date": '09/4/1993',
      "status": 'expert'
    },
    {
      "name": 'Jack',
      "status": 'legend',
      "date": '01/7/1820',
      "month": 'December',
    },
  ];
  List<Map<String, String>> rows2 = [
    {
      "name": 'asdflkjlajsf',
      "date": '23/09/2020edit',
      "month": 'Juneeddit',
      "status": 'completededit'
    },
    {
      "name": 'asdflkjlk',
      "month": 'March',
      "status": 'new',
      "date": '12/4/2020',
    },
  ];
  List<Map<String, dynamic>> cols = [
    {"title": 'Name', 'widthFactor': 0.2, 'key': 'name', 'editable': false},
    {"title": 'Date', 'widthFactor': 0.2, 'key': 'date'},
    {"title": 'Month', 'widthFactor': 0.2, 'key': 'month'},
    {"title": 'Status', 'key': 'status'},
  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    setState(() {
      _editableKey.currentState?.createRow();
    });
  }

  ///Print only edited rows.
  void _printEditedRows() {
    print(rows);
  }

  void _printRows() {
    List<Map<String,String>>? rows = _editableKey.currentState?.rows;
   rows?.forEach((row) { print(row); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: TextButton.icon(
            onPressed: () => _addNewRow(),
            icon: Icon(Icons.add),
            label: Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        title: Text(widget.title),
        actions: [
            ElevatedButton(
                onPressed: () {
                  if(whichRows) {
                    setState(() {
                      _editableKey.currentState?.rows = rows2;
                    });
                  } else {
                    setState(() {
                      _editableKey.currentState?.rows = rows;
                    });
                  }
                  whichRows = !whichRows;
                },
                child: Text('swap',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ElevatedButton(
              onPressed: () {
                _printRows();
              },
              child: Text('print',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
      body: Editable(
        key: _editableKey,
        columns: cols,
        rows: whichRows? rows : rows2,
        zebraStripe: true,
        stripeColor1: Colors.blue,
        stripeColor2: Colors.grey,
        onRowSaved: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print(value);
        },
        borderColor: Colors.blueGrey,
        tdStyle: TextStyle(fontWeight: FontWeight.bold),
        trHeight: 80,
        thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        thAlignment: TextAlign.center,
        thVertAlignment: CrossAxisAlignment.end,
        thPaddingBottom: 3,
        showRemoveIcon: true,
        removeIconColor: Colors.black,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        tdAlignment: TextAlign.left,
        tdEditableMaxLines: 100, // don't limit and allow data to wrap
        tdPaddingTop: 0,
        tdPaddingBottom: 14,
        tdPaddingLeft: 10,
        tdPaddingRight: 8,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
    );
  }
}
