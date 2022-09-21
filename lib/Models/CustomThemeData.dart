import 'package:flutter/material.dart';

class DataTableCellColors {
  int? id;
  String parentName;
  Color defaultBoxShadowColor;
  Color defaultBorderColor;
  Color defaultInputTextColor;

  DataTableCellColors(
      {this.id = -1,
      this.parentName = '',
      this.defaultBoxShadowColor = Colors.white,
      this.defaultBorderColor = Colors.white,
      this.defaultInputTextColor = Colors.white});

  factory DataTableCellColors.fromMap(Map<String, dynamic> json) =>
      DataTableCellColors(
        id: json['id'],
        parentName: json['parentName'],
        defaultBoxShadowColor: Color(int.parse(json['defaultBoxShadowColor'])),
        defaultBorderColor: Color(int.parse(json['defaultBorderColor'])),
        defaultInputTextColor: Color(int.parse(json['defaultInputTextColor'])),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentName': parentName,
      'defaultBoxShadowColor':
          '0x${defaultBoxShadowColor.value.toRadixString(16)}',
      'defaultBorderColor': '0x${defaultBorderColor.value.toRadixString(16)}',
      'defaultInputTextColor':
          '0x${defaultInputTextColor.value.toRadixString(16)}',
    };
  }
}

class DropdownButtonColors {
  int? id;
  String parentName;
  Color defaultBarrierColor;
  Color defaultIconEnableColor;
  Color defaultIconDisabledColor;

  DropdownButtonColors(
      {this.id = -1,
      this.parentName = '',
      this.defaultBarrierColor = Colors.white,
      this.defaultIconEnableColor = Colors.white,
      this.defaultIconDisabledColor = Colors.white});

  factory DropdownButtonColors.fromMap(Map<String, dynamic> json) =>
      DropdownButtonColors(
        id: json['id'],
        parentName: json['parentName'],
        defaultBarrierColor: Color(int.parse(json['defaultBarrierColor'])),
        defaultIconEnableColor:
            Color(int.parse(json['defaultIconEnableColor'])),
        defaultIconDisabledColor:
            Color(int.parse(json['defaultIconDisabledColor'])),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentName': parentName,
      'defaultBarrierColor': '0x${defaultBarrierColor.value.toRadixString(16)}',
      'defaultIconEnableColor':
          '0x${defaultIconEnableColor.value.toRadixString(16)}',
      'defaultIconDisabledColor':
          '0x${defaultIconDisabledColor.value.toRadixString(16)}',
    };
  }
}

class FloatingBoxColors {
  int? id;
  String parentName;
  Color defaultShadowColor;
  Color defaultBackgroundColor;

  FloatingBoxColors(
      {this.id = -1,
      this.parentName = '',
      this.defaultShadowColor = Colors.white,
      this.defaultBackgroundColor = Colors.white});

  factory FloatingBoxColors.fromMap(
          Map<String, dynamic> json) =>
      FloatingBoxColors(
          id: json['id'],
          parentName: json['parentName'],
          defaultShadowColor: Color(int.parse(json['defaultShadowColor'])),
          defaultBackgroundColor:
              Color(int.parse(json['defaultBackgroundColor'])));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentName': parentName,
      'defaultShadowColor': '0x${defaultShadowColor.value.toRadixString(16)}',
      'defaultBackgroundColor':
          '0x${defaultBackgroundColor.value.toRadixString(16)}',
    };
  }
}

class CustomThemeData {
  String name;
  String description;
  DataTableCellColors dataTableCellColors;
  DropdownButtonColors dropdownButtonColors;
  FloatingBoxColors floatingBoxColors;
  Color defaultTextColor;
  Color defaultNavMenuTextColor;
  Color defaultNavMenuBackgroundColor;
  Color defaultAppBackGroundColor;
  Color activeColor;
  Color editColor = Colors.orange;
  Color cancelColor;

  CustomThemeData(
      {required this.name,
      this.description = '',
      required this.dataTableCellColors,
      required this.dropdownButtonColors,
      required this.floatingBoxColors,
      this.defaultTextColor = Colors.white,
      this.defaultNavMenuTextColor = Colors.white,
      this.defaultNavMenuBackgroundColor = Colors.white,
      this.defaultAppBackGroundColor = Colors.white,
      this.activeColor = Colors.white,
      this.editColor = Colors.white,
      this.cancelColor = Colors.white});

  factory CustomThemeData.fromMap(Map<String, dynamic> json) => CustomThemeData(
        name: json['name'],
        description: json['description'],
        defaultTextColor: Color(int.parse(json['defaultTextColor'])),
        defaultNavMenuTextColor:
            Color(int.parse(json['defaultNavMenuTextColor'])),
        defaultNavMenuBackgroundColor:
            Color(int.parse(json['defaultNavMenuBackgroundColor'])),
        defaultAppBackGroundColor:
            Color(int.parse(json['defaultAppBackGroundColor'])),
        activeColor: Color(int.parse(json['activeColor'])),
        editColor: Color(int.parse(json['editColor'])),
        cancelColor: Color(int.parse(json['cancelColor'])),
        dataTableCellColors:
            DataTableCellColors.fromMap(json['dataTableCellColors']),
        dropdownButtonColors:
            DropdownButtonColors.fromMap(json['dropdownButtonColors']),
        floatingBoxColors: FloatingBoxColors.fromMap(json['floatingBoxColors']),
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'defaultTextColor': '0x${defaultTextColor.value.toRadixString(16)}',
      'defaultNavMenuTextColor':
          '0x${defaultNavMenuTextColor.value.toRadixString(16)}',
      'defaultNavMenuBackgroundColor':
          '0x${defaultNavMenuBackgroundColor.value.toRadixString(16)}',
      'defaultAppBackGroundColor':
          '0x${defaultAppBackGroundColor.value.toRadixString(16)}',
      'activeColor': '0x${activeColor.value.toRadixString(16)}',
      'editColor': '0x${editColor.value.toRadixString(16)}',
      'cancelColor': '0x${cancelColor.value.toRadixString(16)}',
      'dataTableCellColors': dataTableCellColors.toMap(),
      'dropdownButtonColors': dropdownButtonColors.toMap(),
      'floatingBoxColors': floatingBoxColors.toMap(),
    };
  }
}
