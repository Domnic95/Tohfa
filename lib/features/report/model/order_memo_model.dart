// To parse this JSON data, do
//
//     final orderMemoResModel = orderMemoResModelFromJson(jsonString);

import 'dart:convert';

OrderMemoResModel orderMemoResModelFromJson(String str) => OrderMemoResModel.fromJson(json.decode(str));

String orderMemoResModelToJson(OrderMemoResModel data) => json.encode(data.toJson());

class OrderMemoResModel {
  List<OrderMemo>? data;

  OrderMemoResModel({
    this.data,
  });

  OrderMemoResModel copyWith({
    List<OrderMemo>? data,
    bool? succeeded,
    List<dynamic>? messages,
  }) =>
      OrderMemoResModel(
        data: data ?? this.data,
      );

  factory OrderMemoResModel.fromJson(Map<String, dynamic> json) => OrderMemoResModel(
    data: json["data"] == null ? [] : List<OrderMemo>.from(json["data"]!.map((x) => OrderMemo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderMemo {
  String? siteId;
  dynamic terminalTransId;
  String? salesPersonId;
  dynamic noofprintallowed;
  String? salesPersonName;
  String? orNo;
  String? salesIndentTransactionId;
  String? tokenId;
  String? tokenNo;
  String? orDate;
  String? customersId;
  String? customerName;
  String? customerSiteId;
  String? customerContact;
  String? customerSiteName;
  String? vendorId;
  String? totalBoxCount;
  String? totalRecordCount;
  String? totalQty;
  String? totalUqcQty;
  String? totalGrossAmt;
  String? totalNetRate;
  String? lessTotalDiscAmt;
  String? addLessOtherAmt;
  String? totalBasicAmt;
  String? totalTaxesAmt;
  String? totalNetOrderAmt;
  String? addLessAdjustment;
  String? roundOff;
  String? totalPayOrderAmt;
  String? remarks;
  String? sectionId;
  String? userId;
  String? pkgStatus;
  String? soStatus;
  String? dcStatus;
  String? orStatus;
  dynamic classMasterId;
  dynamic printCount;
  String? sectionCode;
  String? trmlTransactionIdNo;
  dynamic remarksId;
  dynamic id;
  String? createdBy;
  DateTime? createdOn;
  String? modifiedBy;
  DateTime? modifiedOn;
  bool? isActive;

  OrderMemo({
    this.siteId,
    this.terminalTransId,
    this.salesPersonId,
    this.noofprintallowed,
    this.salesPersonName,
    this.orNo,
    this.salesIndentTransactionId,
    this.tokenId,
    this.tokenNo,
    this.orDate,
    this.customersId,
    this.customerName,
    this.customerSiteId,
    this.customerContact,
    this.customerSiteName,
    this.vendorId,
    this.totalBoxCount,
    this.totalRecordCount,
    this.totalQty,
    this.totalUqcQty,
    this.totalGrossAmt,
    this.totalNetRate,
    this.lessTotalDiscAmt,
    this.addLessOtherAmt,
    this.totalBasicAmt,
    this.totalTaxesAmt,
    this.totalNetOrderAmt,
    this.addLessAdjustment,
    this.roundOff,
    this.totalPayOrderAmt,
    this.remarks,
    this.sectionId,
    this.userId,
    this.pkgStatus,
    this.soStatus,
    this.dcStatus,
    this.orStatus,
    this.classMasterId,
    this.printCount,
    this.sectionCode,
    this.trmlTransactionIdNo,
    this.remarksId,
    this.id,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
  });

  OrderMemo copyWith({
    String? siteId,
    dynamic terminalTransId,
    String? salesPersonId,
    dynamic noofprintallowed,
    String? salesPersonName,
    String? orNo,
    String? salesIndentTransactionId,
    String? tokenId,
    String? tokenNo,
    String? orDate,
    String? customersId,
    String? customerName,
    String? customerSiteId,
    String? customerContact,
    String? customerSiteName,
    String? vendorId,
    String? totalBoxCount,
    String? totalRecordCount,
    String? totalQty,
    String? totalUqcQty,
    String? totalGrossAmt,
    String? totalNetRate,
    String? lessTotalDiscAmt,
    String? addLessOtherAmt,
    String? totalBasicAmt,
    String? totalTaxesAmt,
    String? totalNetOrderAmt,
    String? addLessAdjustment,
    String? roundOff,
    String? totalPayOrderAmt,
    String? remarks,
    String? sectionId,
    String? userId,
    String? pkgStatus,
    String? soStatus,
    String? dcStatus,
    String? orStatus,
    dynamic classMasterId,
    dynamic printCount,
    String? sectionCode,
    String? trmlTransactionIdNo,
    dynamic remarksId,
    dynamic id,
    String? createdBy,
    DateTime? createdOn,
    String? modifiedBy,
    DateTime? modifiedOn,
    bool? isActive,
  }) =>
      OrderMemo(
        siteId: siteId ?? this.siteId,
        terminalTransId: terminalTransId ?? this.terminalTransId,
        salesPersonId: salesPersonId ?? this.salesPersonId,
        noofprintallowed: noofprintallowed ?? this.noofprintallowed,
        salesPersonName: salesPersonName ?? this.salesPersonName,
        orNo: orNo ?? this.orNo,
        salesIndentTransactionId: salesIndentTransactionId ?? this.salesIndentTransactionId,
        tokenId: tokenId ?? this.tokenId,
        tokenNo: tokenNo ?? this.tokenNo,
        orDate: orDate ?? this.orDate,
        customersId: customersId ?? this.customersId,
        customerName: customerName ?? this.customerName,
        customerSiteId: customerSiteId ?? this.customerSiteId,
        customerContact: customerContact ?? this.customerContact,
        customerSiteName: customerSiteName ?? this.customerSiteName,
        vendorId: vendorId ?? this.vendorId,
        totalBoxCount: totalBoxCount ?? this.totalBoxCount,
        totalRecordCount: totalRecordCount ?? this.totalRecordCount,
        totalQty: totalQty ?? this.totalQty,
        totalUqcQty: totalUqcQty ?? this.totalUqcQty,
        totalGrossAmt: totalGrossAmt ?? this.totalGrossAmt,
        totalNetRate: totalNetRate ?? this.totalNetRate,
        lessTotalDiscAmt: lessTotalDiscAmt ?? this.lessTotalDiscAmt,
        addLessOtherAmt: addLessOtherAmt ?? this.addLessOtherAmt,
        totalBasicAmt: totalBasicAmt ?? this.totalBasicAmt,
        totalTaxesAmt: totalTaxesAmt ?? this.totalTaxesAmt,
        totalNetOrderAmt: totalNetOrderAmt ?? this.totalNetOrderAmt,
        addLessAdjustment: addLessAdjustment ?? this.addLessAdjustment,
        roundOff: roundOff ?? this.roundOff,
        totalPayOrderAmt: totalPayOrderAmt ?? this.totalPayOrderAmt,
        remarks: remarks ?? this.remarks,
        sectionId: sectionId ?? this.sectionId,
        userId: userId ?? this.userId,
        pkgStatus: pkgStatus ?? this.pkgStatus,
        soStatus: soStatus ?? this.soStatus,
        dcStatus: dcStatus ?? this.dcStatus,
        orStatus: orStatus ?? this.orStatus,
        classMasterId: classMasterId ?? this.classMasterId,
        printCount: printCount ?? this.printCount,
        sectionCode: sectionCode ?? this.sectionCode,
        trmlTransactionIdNo: trmlTransactionIdNo ?? this.trmlTransactionIdNo,
        remarksId: remarksId ?? this.remarksId,
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        isActive: isActive ?? this.isActive,
      );

  factory OrderMemo.fromJson(Map<String, dynamic> json) => OrderMemo(
    siteId: json["siteId"],
    terminalTransId: json["terminalTransId"],
    salesPersonId: json["salesPersonId"],
    noofprintallowed: json["noofprintallowed"],
    salesPersonName: json["salesPersonName"],
    orNo: json["orNo"],
    salesIndentTransactionId: json["salesIndentTransactionId"],
    tokenId: json["tokenId"],
    tokenNo: json["tokenNo"],
    orDate: json["orDate"],
    customersId: json["customersId"],
    customerName: json["customer_name"],
    customerSiteId: json["customerSiteId"],
    customerContact: json["customerContact"],
    customerSiteName: json["customer_site_name"],
    vendorId: json["vendorId"],
    totalBoxCount: json["totalBoxCount"],
    totalRecordCount: json["totalRecordCount"],
    totalQty: json["totalQty"],
    totalUqcQty: json["totalUQCQty"],
    totalGrossAmt: json["totalGrossAmt"],
    totalNetRate: json["totalNetRate"],
    lessTotalDiscAmt: json["lessTotalDiscAmt"],
    addLessOtherAmt: json["addLessOtherAmt"],
    totalBasicAmt: json["totalBasicAmt"],
    totalTaxesAmt: json["totalTaxesAmt"],
    totalNetOrderAmt: json["totalNetOrderAmt"],
    addLessAdjustment: json["addLessAdjustment"],
    roundOff: json["roundOff"],
    totalPayOrderAmt: json["totalPayOrderAmt"],
    remarks: json["remarks"],
    sectionId: json["sectionId"],
    userId: json["userId"],
    pkgStatus: json["pkgStatus"],
    soStatus: json["soStatus"],
    dcStatus: json["dcStatus"],
    orStatus: json["orStatus"],
    classMasterId: json["classMasterId"],
    printCount: json["printCount"],
    sectionCode: json["section_code"],
    trmlTransactionIdNo: json["trmlTransactionIdNo"],
    remarksId: json["remarksId"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"] == null ? null : DateTime.parse(json["modifiedOn"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "siteId": siteId,
    "terminalTransId": terminalTransId,
    "salesPersonId": salesPersonId,
    "noofprintallowed": noofprintallowed,
    "salesPersonName": salesPersonName,
    "orNo": orNo,
    "salesIndentTransactionId": salesIndentTransactionId,
    "tokenId": tokenId,
    "tokenNo": tokenNo,
    "orDate": orDate,
    "customersId": customersId,
    "customer_name": customerName,
    "customerSiteId": customerSiteId,
    "customerContact": customerContact,
    "customer_site_name": customerSiteName,
    "vendorId": vendorId,
    "totalBoxCount": totalBoxCount,
    "totalRecordCount": totalRecordCount,
    "totalQty": totalQty,
    "totalUQCQty": totalUqcQty,
    "totalGrossAmt": totalGrossAmt,
    "totalNetRate": totalNetRate,
    "lessTotalDiscAmt": lessTotalDiscAmt,
    "addLessOtherAmt": addLessOtherAmt,
    "totalBasicAmt": totalBasicAmt,
    "totalTaxesAmt": totalTaxesAmt,
    "totalNetOrderAmt": totalNetOrderAmt,
    "addLessAdjustment": addLessAdjustment,
    "roundOff": roundOff,
    "totalPayOrderAmt": totalPayOrderAmt,
    "remarks": remarks,
    "sectionId": sectionId,
    "userId": userId,
    "pkgStatus": pkgStatus,
    "soStatus": soStatus,
    "dcStatus": dcStatus,
    "orStatus": orStatus,
    "classMasterId": classMasterId,
    "printCount": printCount,
    "section_code": sectionCode,
    "trmlTransactionIdNo": trmlTransactionIdNo,
    "remarksId": remarksId,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn?.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn?.toIso8601String(),
    "isActive": isActive,
  };
}
