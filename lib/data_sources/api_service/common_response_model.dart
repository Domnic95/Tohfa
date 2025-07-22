
import 'dart:convert';

class ResponseModel<T> {
  Meta meta;
  T data;

  ResponseModel({
    required this.meta,
    required this.data,
  });

  factory ResponseModel.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) =>
      ResponseModel<T>(
        meta: Meta.fromJson(json["meta"]),
        data: fromJsonT(json["data"]),
      );

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) => {
    "meta": meta.toJson(),
    "data": toJsonT(data),
  };
}

class Meta {
  String status;
  String message;

  Meta({
    required this.status,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

class ListingModel<T, T2> {
  T? columns;
  T2 tableData;
  Paginate? pagination;
  bool allDataLoaded;
  List<String> statusList;

  ListingModel({
    this.columns,
    required this.tableData,
     this.pagination,
    this.allDataLoaded=false,
    required this.statusList
  });

    factory ListingModel.fromJson(
      Map<String, dynamic> json, {
        T? Function(Map<String, dynamic>)? forColumns,
        T? Function(Map<String, dynamic>)? forColumns2,
        String? columnsParamName,
        String? columnsParamName2,
        T2 Function(String)? forTableData,
      }) =>
      ListingModel<T, T2>(
        columns: forColumns != null ? forColumns(json[columnsParamName??"columns"]) : null,
        tableData:forTableData!(jsonEncode(json[columnsParamName2??"table_data"])),
        pagination:json["paginate"] != null? Paginate.fromJson(json["paginate"]):null,
        statusList: json["status_list"] != null ? (json["status_list"] as List<dynamic>).map((e) => e.toString()).toList() : [],

      );

  Map<String, dynamic> toJson(
      Map<String, dynamic> Function(T)? toJsonT,
      Map<String, dynamic> Function(T2)? toJsonT2,
      ) =>
      {
        "columns": toJsonT != null ? toJsonT(columns as T) : null,
        "table_data": jsonEncode(tableData),
        "paginate": pagination?.toJson(),
      };
  ListingModel<T, T2> copyWith({
    T? columns,
    T2? tableData,
    Paginate? pagination,
    bool? allDataLoaded,
    List<String>? statusList,
  }) {
    return ListingModel<T, T2>(
      columns: columns ?? this.columns,
      tableData: tableData ?? this.tableData,
      pagination: pagination ?? this.pagination,
      allDataLoaded: allDataLoaded ?? this.allDataLoaded, statusList: statusList??this.statusList,
    );
  }
}

class Paginate {
  int total;
  int currentPage;
  int totalPages;

  Paginate({
    required this.total,
    required this.currentPage,
    required this.totalPages,
  });

  factory Paginate.fromJson(Map<String, dynamic> json) => Paginate(
    total: json["total"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}
