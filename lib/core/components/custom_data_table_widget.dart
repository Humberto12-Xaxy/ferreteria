// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDataTable extends StatefulWidget {
  final List<HeaderElement> headers;
  final List<RowElement> rows;
  final Color backgroundColor;
  final Color headerBackgroundColor;
  final TextStyle textStyle;
  final TextStyle headerTextStyle;
  final TextAlign? textAlign;
  final TextAlign? headerTextAlign;
  final Color? activeColor;
  final EdgeInsets padding;
  final BoxBorder? borderTable;
  final TypeSelection typeSelection;
  final Function(RowElement rowSelected)? onRowSelected;

  const CustomDataTable({
    super.key,
    required this.headers,
    required this.rows,
    this.backgroundColor = Colors.white,
    this.headerBackgroundColor = Colors.grey,
    this.textStyle = const TextStyle(),
    this.headerTextStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.activeColor,
    this.padding = const EdgeInsets.all(10),
    this.borderTable,
    this.textAlign,
    this.headerTextAlign,
    required this.typeSelection,
    this.onRowSelected,
  });

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  final FocusNode _focusNode = FocusNode();
  List<RowElement> selectedRows = [];

  @override
  void initState() {
    super.initState();
    if (widget.headers.isEmpty) {
      throw Exception('Headers cannot be empty');
    }
    if (widget.rows.isNotEmpty) {
      if (widget.headers.length != widget.rows.first.cells.length) {
        throw Exception('Headers and rows must have the same length');
      }
    }

    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     HardwareKeyboard.instance.addHandler(_handleKeyEvent);
    //   } else {
    //     HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    //   }
    // });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // bool _handleKeyEvent(KeyEvent event) {
  //   // Evento que recibe las teclas presionadas
  //   if (event is KeyDownEvent) {
  //     final index = widget.rows.indexOf(selectedRows.first);
  //     if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
  //       // Mover el selectedRows hacia abajo si es posible
  //       print('Movemos hacia abajo');
  //       if (index < widget.rows.length - 1) {
  //         selectRow(widget.rows[index + 1]);
  //       }
  //     } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
  //       // Mover el selectedRows hacia arriba si es posible
  //       print('Movemos hacia arriba');
  //       if (index > 0) {
  //         selectRow(widget.rows[index - 1]);
  //       }
  //     }
  //   }
  //   return false;
  // }

  void selectRow(RowElement row) {
    if (selectedRows.contains(row)) {
      selectedRows.remove(row);
      setState(() {});
      return;
    }
    if (widget.typeSelection == TypeSelection.single) {
      selectedRows.clear();
    }
    selectedRows.add(row);
    setState(() {
      print(row);
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = widget.borderTable ??
        Border(bottom: BorderSide(color: Colors.black, width: 1));
    final textAlign = widget.textAlign ?? TextAlign.left;
    final headerTextAlign = widget.headerTextAlign ?? TextAlign.left;
    final activeColor = widget.activeColor ?? Colors.blue;
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
        onTap: () {
          print('Focus colocado');
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.headerBackgroundColor,
              ),
              child: Row(
                children: widget.headers
                    .map((e) => Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: border,
                            ),
                            padding: EdgeInsets.all(8),
                            color: e.backgroundColor,
                            child: Text(
                              e.text,
                              textAlign: e.align ?? headerTextAlign,
                              style: e.textStyle ?? widget.headerTextStyle,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Expanded(
                child: widget.rows.isEmpty
                    ? Center(
                        child: Text('No hay datos'),
                      )
                    : ListView.builder(
                        itemCount: widget.rows.length,
                        itemBuilder: (context, index) {
                          final row = widget.rows[index];
                          return InkWell(
                            onTap: () {
                              selectRow(row);
                              widget.onRowSelected?.call(widget.rows[index]);
                            },
                            child: Row(
                              children: row.cells
                                  .map((e) => Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: border,
                                            color: selectedRows.contains(row)
                                                ? activeColor
                                                : e.backgroundColor,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            e.text,
                                            textAlign: e.align ?? textAlign,
                                            style:
                                                e.textStyle ?? widget.textStyle,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          );
                        },
                      )),
          ],
        ),
      ),
    );
  }
}

class HeaderElement {
  final String text;
  final TextAlign? align;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  HeaderElement(
      {this.backgroundColor, this.textStyle, required this.text, this.align});
}

class RowElement {
  final List<DataCellElement> cells;

  RowElement({required this.cells});

  @override
  String toString() => 'RowElement(cells: $cells)';
}

class DataCellElement {
  final String text;
  final TextAlign? align;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  DataCellElement(
      {this.backgroundColor, this.textStyle, required this.text, this.align});

  @override
  String toString() {
    return 'DataCellElement(text: $text, align: $align, backgroundColor: $backgroundColor, textStyle: $textStyle)';
  }
}

enum TypeSelection { single, multiple }
