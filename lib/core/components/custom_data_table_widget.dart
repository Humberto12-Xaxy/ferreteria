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
  // final BoxBorder? borderTable;
  final TypeSelection typeSelection;
  final Function(RowElement rowSelected)? onRowSelected;
  final double? heightRow;

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
    // this.borderTable,
    this.textAlign,
    this.headerTextAlign,
    this.typeSelection = TypeSelection.single,
    this.onRowSelected,
    this.heightRow = 60,
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
    verifyErrors();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    addingDataCelsIfThereIsAnActionColumn();
    // final border = widget.borderTable ??
    //     Border(bottom: BorderSide(color: Colors.black, width: 1));
    final textAlign = widget.textAlign ?? TextAlign.left;
    final headerTextAlign = widget.headerTextAlign ?? TextAlign.left;
    final activeColor = widget.activeColor ?? Colors.blue;
    return Padding(
      padding: widget.padding,
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
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 2)),
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
              child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget.rows.length,
            itemBuilder: (context, index) {
              final row = widget.rows[index];
              return InkWell(
                onTap: widget.onRowSelected == null
                    ? null
                    : () {
                        selectRow(row);
                        widget.onRowSelected?.call(widget.rows[index]);
                      },
                child: SizedBox(
                  height: widget.heightRow,
                  child: Row(
                    children: row.cells
                        .map((e) => Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: border,
                                  color: selectedRows.contains(row)
                                      ? activeColor
                                      : e.backgroundColor,
                                ),
                                padding: EdgeInsets.all(8),
                                child: e.content != null
                                    ? MediaQuery.removePadding(
                                        context: context,
                                        child: e.content!,
                                      )
                                    : Text(
                                        e.text,
                                        textAlign: e.align ?? textAlign,
                                        style: e.textStyle ?? widget.textStyle,
                                      ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  void verifyErrors() {
    print('Verificando errores');
    // Verify if headers is empty
    if (widget.headers.isEmpty) {
      throw Exception('Headers cannot be empty');
    }

    final amountHeaders =
        widget.headers.where((header) => !header.isActionColumn).length;
    final amountRows = widget.rows.first.cells.length;
    // Verify if all rows have the same length
    widget.rows.any(
      (element) {
        if (element.cells.length != amountRows) {
          throw Exception(
              'The row $element hanst the same length of others rows');
        }
        return false;
      },
    );

    // Verify if headers and rows have the same length
    if (amountHeaders != amountRows) {
      throw Exception('Headers and rows must have the same length');
    }
  }

  void addingDataCelsIfThereIsAnActionColumn() {
    for (var header in widget.headers) {
      print('HOla');
      if (header.isActionColumn) {
        print('Se añade una columna de acción');
        for (var row in widget.rows) {
          row.cells.add(DataCellElement(
              text: '', content: header.action!.copyWith(rowAssigned: row)));
        }
      }
    }
  }
}

class HeaderElement {
  final String text;
  final TextAlign? align;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool isActionColumn;
  final ActionWidget? action;
  HeaderElement(
      {this.backgroundColor,
      this.action,
      this.textStyle,
      required this.text,
      this.align,
      this.isActionColumn = false});
}

class RowElement {
  final List<DataCellElement> cells;

  RowElement({required this.cells});

  @override
  String toString() => cells.toString();
}

class DataCellElement {
  final String text;
  final Widget? content;
  final TextAlign? align;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  DataCellElement(
      {this.content,
      this.backgroundColor,
      this.textStyle,
      required this.text,
      this.align});

  @override
  String toString() {
    return text;
  }
}

enum TypeSelection { single, multiple }

// Tendremos que CREAR una clase que se llamara AccionWidget que extendera de Widget
// debido a que contruiremos widgets custom para la columna de acciones

/// An abstract class that represents a widget with an associated row element.
///
/// This class extends [StatelessWidget] and provides a way to associate a
/// [RowElement] with the widget. It also includes a method to create a copy
/// of the widget with a potentially different [RowElement].
abstract class ActionWidget extends StatelessWidget {
  /// The [RowElement] associated with this widget.
  final RowElement? _rowAssigned;

  /// Creates an [ActionWidget] with an optional [RowElement].
  ///
  /// The [rowAssigned] parameter can be used to associate a [RowElement]
  /// with this widget.
  const ActionWidget({super.key, RowElement? rowAssigned})
      : _rowAssigned = rowAssigned;

  /// Returns the [RowElement] associated with this widget.
  RowElement? get rowAssigned => _rowAssigned;

  /// Creates a copy of this [ActionWidget] with an optional new [RowElement].
  ///
  /// The [rowAssigned] parameter can be used to specify a new [RowElement]
  /// for the copied widget. If not provided, the current [rowAssigned] will
  /// be used.
  ActionWidget copyWith({RowElement? rowAssigned});
}

// Ahora con la clase anterior podremos crear widgets custo m para la columna de acciones
// por ejemplo un boton para las acciones

/// A widget that represents a button action within a data table.
///
/// The [ActionButton] widget is used to create an icon button that performs
/// an action when pressed. It extends the [ActionWidget] class.
///
/// The [onRowSelected] callback is triggered when the button is pressed,
/// passing the selected row as an argument.
///
/// The [icon] parameter specifies the icon to be displayed on the button.
///
/// Example usage:
/// ```dart
/// ActionButton(
///   onRowSelected: (row) {
///     // Handle row selection
///   },
///   icon: Icons.edit,
/// )
/// ```
///
/// See also:
/// - [ActionWidget], the base class for action widgets.
class ActionButton extends ActionWidget {
  final Function(RowElement rowSelected) onRowSelected;
  final IconData icon;
  final Color? colorButton;
  final Color? colorIcon;

  const ActionButton({
    required this.onRowSelected,
    required this.icon,
    this.colorButton,
    this.colorIcon,
    super.key,
    super.rowAssigned,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onRowSelected(rowAssigned!);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: colorButton ?? Theme.of(context).primaryColor,
            shape: BoxShape.circle),
        child: Icon(
          icon,
          size: 20,
          color: colorIcon ?? Colors.white,
        ),
      ),
    );
    // return Align(
    //   alignment: Alignment.center,
    //   child: IconButton(
    //     padding: EdgeInsets.zero, // Elimina padding predeterminado
    //     constraints: const BoxConstraints(), // Evita restricciones internas
    //     icon: Icon(
    //       icon,
    //       size: 20,
    //     ),
    //     onPressed: () {
    //       onRowSelected(rowAssigned!);
    //     },
    //   ),
    // );
  }

  @override
  ActionButton copyWith({RowElement? rowAssigned}) {
    return ActionButton(
      colorButton: colorButton,
      colorIcon: colorIcon,
      onRowSelected: onRowSelected,
      icon: icon,
      rowAssigned: rowAssigned ?? this.rowAssigned,
    );
  }
}

class RowActionButtons extends ActionWidget {
  final List<ActionButton> actions;
  final double spacing;
  const RowActionButtons(
      {super.key,
      required this.actions,
      required this.spacing,
      super.rowAssigned});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: spacing,
      children: actions,
    );
  }

  @override
  ActionWidget copyWith({RowElement? rowAssigned}) {
    final actionsWithRowAssigned = actions
        .map((action) => action.copyWith(rowAssigned: rowAssigned))
        .toList();

    return RowActionButtons(
        actions: actionsWithRowAssigned,
        spacing: spacing,
        rowAssigned: rowAssigned ?? this.rowAssigned);
  }
}
