import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'workorder.dart';

class Notifi_list extends StatelessWidget {
  const Notifi_list({super.key});

  @override
  Widget build(BuildContext context) {
    return const JsonDataGrid();
  }
}

class JsonDataGrid extends StatefulWidget {
  const JsonDataGrid({super.key});

  @override
  _JsonDataGridState createState() => _JsonDataGridState();
}

class _JsonDataGridState extends State<JsonDataGrid> {
  late _JsonDataGridSource jsonDataGridSource;
  List<_Product> productlist = [];

  Future generateProductList() async {
    var response = await http.post(Uri.parse('http://localhost:5000/notlist'));
    var list =
        json.decode(response.body)['data227'].cast<Map<String, dynamic>>();
    productlist =
        await list.map<_Product>((json) => _Product.fromJson(json)).toList();
    jsonDataGridSource = _JsonDataGridSource(productlist);
    print(productlist);
    return productlist;
  }

  List<GridColumn> getColumns() {
    List<GridColumn> columns;
    columns = ([
      GridColumn(
        columnName: 'NOTIFICATION NUMBER',
        width: 200,
        label: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: const Text(
            'NOTIFICATION NUMBER',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'DESCRIPT',
        width: 200,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'DESCRIPT',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'EQUIDESCR',
        width: 200,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'EQUIDESCR',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'NOTIFDATE',
        width: 200,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'NOTIFDATE',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'NOTIFTIME',
        width: 200,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'NOTIFTIME',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'STARTDATE',
        width: 200,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'STARTDATE',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'ENDDATE',
        width: 200,
        label: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: const Text(
            'END DATE',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: '',
        width: 200,
        label: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: const Text(
            'PRIOTYPE',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
    ]);
    return columns;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTIFICATION LIST'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WorkOrder()));
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: generateProductList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.hasData
                ? SfDataGrid(
                    source: jsonDataGridSource,
                    columns: getColumns(),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  );
          }),
    );
  }
}

class _Product {
  factory _Product.fromJson(Map<String, dynamic> json) {
    return _Product(
      NOTIFICAT: json['NOTIFICAT']['_text'],
      DESCRIPT: json['DESCRIPT']['_text'],
      EQUIDESCR: json['EQUIDESCR']['_text'],
      NOTIFDATE: json['NOTIFDATE']['_text'],
      NOTIFTIME: json['NOTIFTIME']['_text'],
      STARTDATE: json['STARTDATE']['_text'],
      ENDDATE: json['ENDDATE']['_text'],
      PRIOTYPE: json['PRIOTYPE']['_text'],
    );
  }

  _Product({
    this.NOTIFICAT,
    this.DESCRIPT,
    this.EQUIDESCR,
    this.NOTIFDATE,
    this.NOTIFTIME,
    this.STARTDATE,
    this.ENDDATE,
    this.PRIOTYPE,
  });
  String? NOTIFICAT;
  String? DESCRIPT;
  String? EQUIDESCR;
  String? NOTIFDATE;
  String? NOTIFTIME;
  String? STARTDATE;
  String? ENDDATE;
  String? PRIOTYPE;
}

class _JsonDataGridSource extends DataGridSource {
  _JsonDataGridSource(this.productlist) {
    buildDataGridRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<_Product> productlist = [];

  void buildDataGridRow() {
    dataGridRows = productlist.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'NOTIFICAT', value: dataGridRow.NOTIFICAT),
        DataGridCell<String>(
            columnName: 'DESCRIPTION', value: dataGridRow.DESCRIPT),
        DataGridCell<String>(
            columnName: 'EQUIDESCR', value: dataGridRow.EQUIDESCR),
        DataGridCell<String>(
            columnName: 'NOTIFDATE', value: dataGridRow.NOTIFDATE),
        DataGridCell<String>(
            columnName: 'NOTIFTIME', value: dataGridRow.NOTIFTIME),
        DataGridCell<String>(
            columnName: 'STARTDATE', value: dataGridRow.STARTDATE),
        DataGridCell<String>(columnName: 'ENDDATE', value: dataGridRow.ENDDATE),
        DataGridCell<String>(
            columnName: 'PRIOTYPE', value: dataGridRow.PRIOTYPE),
      ]);
    }).toList(growable: false);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[4].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[5].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[6].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[7].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
