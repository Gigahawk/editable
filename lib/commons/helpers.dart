import 'package:flutter/material.dart';

/// Generates empty columns using the specified columnCount,
/// if no column count is provided, it uses the [columns.length] value
List<Map<String,dynamic>> columnBlueprint(int columnCount, List<Map<String,dynamic>>? columns) {
  List<Map<String,dynamic>> data = List.generate(
      columnCount,
          (index) => {'title': '', 'index': index, 'key': index});
  columns = [...data];
  return columns;
}

/// Generates empty rows from rowCount values provided
List<Map<String,String>> rowBlueprint(int rowCount, List<Map<String,dynamic>>? columns, List<Map<String,String>>? rows) {
  List<Map<String,String>> sampleRow = [];
  for (var i = 0; i < rowCount; i++) {
    Map<String,String> item = {};
    columns?.forEach((element) {
      item[element['key']] = '';
    });
    sampleRow.add(item);
  }
  rows = [...sampleRow];
  return rows;
}

/// adds a row to existing row lists
List<Map<String,String>>? addOneRow(List<Map<String,dynamic>>? columns, List<Map<String,String>>? rows) {
  Map<String,String> item = {};
  columns?.forEach((element) {
    item[element['key']] = '';
  });
  rows?.add(item);
  return rows;
}

List<Map<String,String>>? removeOneRow(List<Map<String,dynamic>>? columns, List<Map<String,String>>? rows, int rowToDelete) {
  rows?.removeAt(rowToDelete);
  return rows;
}

///Create an empty column for saveIcon
Widget iconColumn(bool showSaveIcon, double thPaddingTop, double thPaddingBottom) {
  return Visibility(
    visible: showSaveIcon,
    child: Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.only(
          top: thPaddingTop,
          bottom: thPaddingBottom,
        ),
      ),
    ),
  );
}
