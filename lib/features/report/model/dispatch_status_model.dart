// To parse this JSON data, do
//
//     final dispatchStatusResModel = dispatchStatusResModelFromJson(jsonString);

import 'dart:convert';

DispatchStatusResModel dispatchStatusResModelFromJson(String str) => DispatchStatusResModel.fromJson(json.decode(str));

String dispatchStatusResModelToJson(DispatchStatusResModel data) => json.encode(data.toJson());

class DispatchStatusResModel {
  List<DispatchStatus>? data;

  DispatchStatusResModel({
    this.data,
  });

  DispatchStatusResModel copyWith({
    List<DispatchStatus>? data,
  }) =>
      DispatchStatusResModel(
        data: data ?? this.data,
      );

  factory DispatchStatusResModel.fromJson(Map<String, dynamic> json) => DispatchStatusResModel(
    data: json["data"] == null ? [] : List<DispatchStatus>.from(json["data"]!.map((x) => DispatchStatus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DispatchStatus {
  dynamic salesInvoiceNo;
  dynamic date;
  dynamic orNo;
  dynamic status;
  dynamic discountpercentage;
  dynamic refDocNo;
  dynamic lrId;
  dynamic refDocDate;
  dynamic customerSiteId;
  dynamic transitDays;
  dynamic transitDueDate;
  dynamic transporterName;
  dynamic creditDueDate;
  dynamic agentName;
  dynamic commisionRate;
  dynamic totalQty;
  dynamic totalValue;
  dynamic totalGrossAmt;
  dynamic dispatchStatus;
  dynamic discount;
  dynamic freightCharges;
  dynamic basicValue;
  dynamic integratedGst;
  dynamic roundOff;
  dynamic netAmount;
  dynamic sgst;
  dynamic cgst;
  dynamic igst;
  dynamic others;
  dynamic bondNo;
  dynamic portCode;
  dynamic shippingBill;
  dynamic shippingBillDate;
  dynamic logisticsNo;
  dynamic declarationAmount;
  dynamic parcelid;
  dynamic lrDate;
  dynamic remarks;
  dynamic siteId;
  dynamic customerSiteName;
  dynamic details;
  dynamic parcelManagements;
  dynamic billContactNo;
  dynamic customerBillEmail;
  dynamic billAddress;
  dynamic customerBillGstin;
  dynamic customerBillGstState;
  dynamic shipAddress;
  dynamic customerShipGstin;
  dynamic customerShipGstState;
  dynamic agent;
  dynamic termName;
  dynamic siteAddress1;
  dynamic customerName;
  dynamic siteContactMobile;
  dynamic siteWebsite;
  dynamic siteEmail;
  dynamic siteGstin;
  dynamic siteGstinState;
  dynamic siteCinNo;
  dynamic reportLogo;
  dynamic id;
  dynamic createdBy;
  DateTime? createdOn;
  dynamic modifiedBy;
  DateTime? modifiedOn;
  bool? isActive;

  DispatchStatus({
    this.salesInvoiceNo,
    this.date,
    this.status,
    this.discountpercentage,
    this.totalGrossAmt,
    this.refDocNo,
    this.lrId,
    this.refDocDate,
    this.customerSiteId,
    this.transitDays,
    this.transitDueDate,
    this.transporterName,
    this.creditDueDate,
    this.agentName,
    this.commisionRate,
    this.totalQty,
    this.totalValue,
    this.discount,
    this.freightCharges,
    this.basicValue,
    this.integratedGst,
    this.roundOff,
    this.netAmount,
    this.sgst,
    this.cgst,
    this.igst,
    this.others,
    this.orNo,
    this.bondNo,
    this.portCode,
    this.shippingBill,
    this.dispatchStatus,
    this.shippingBillDate,
    this.logisticsNo,
    this.declarationAmount,
    this.parcelid,
    this.lrDate,
    this.remarks,
    this.siteId,
    this.customerSiteName,
    this.details,
    this.parcelManagements,
    this.billContactNo,
    this.customerBillEmail,
    this.billAddress,
    this.customerBillGstin,
    this.customerBillGstState,
    this.shipAddress,
    this.customerShipGstin,
    this.customerShipGstState,
    this.agent,
    this.termName,
    this.siteAddress1,
    this.customerName,
    this.siteContactMobile,
    this.siteWebsite,
    this.siteEmail,
    this.siteGstin,
    this.siteGstinState,
    this.siteCinNo,
    this.reportLogo,
    this.id,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
  });

  DispatchStatus copyWith({
    dynamic salesInvoiceNo,
    dynamic date,
    dynamic status,
    dynamic discountpercentage,
    dynamic refDocNo,
    dynamic lrId,
    dynamic orNo,
    dynamic refDocDate,
    dynamic totalGrossAmt,
    dynamic customerSiteId,
    dynamic transitDays,
    dynamic transitDueDate,
    dynamic transporterName,
    dynamic creditDueDate,
    dynamic agentName,
    dynamic commisionRate,
    dynamic dispatchStatus,
    dynamic totalQty,
    dynamic totalValue,
    dynamic discount,
    dynamic freightCharges,
    dynamic basicValue,
    dynamic integratedGst,
    dynamic roundOff,
    dynamic netAmount,
    dynamic sgst,
    dynamic cgst,
    dynamic igst,
    dynamic others,
    dynamic bondNo,
    dynamic portCode,
    dynamic shippingBill,
    dynamic shippingBillDate,
    dynamic logisticsNo,
    dynamic declarationAmount,
    dynamic parcelid,
    dynamic lrDate,
    dynamic remarks,
    dynamic siteId,
    dynamic customerSiteName,
    dynamic details,
    dynamic parcelManagements,
    dynamic billContactNo,
    dynamic customerBillEmail,
    dynamic billAddress,
    dynamic customerBillGstin,
    dynamic customerBillGstState,
    dynamic shipAddress,
    dynamic customerShipGstin,
    dynamic customerShipGstState,
    dynamic agent,
    dynamic termName,
    dynamic siteAddress1,
    dynamic customerName,
    dynamic siteContactMobile,
    dynamic siteWebsite,
    dynamic siteEmail,
    dynamic siteGstin,
    dynamic siteGstinState,
    dynamic siteCinNo,
    dynamic reportLogo,
    dynamic id,
    dynamic createdBy,
    DateTime? createdOn,
    dynamic modifiedBy,
    DateTime? modifiedOn,
    bool? isActive,
  }) =>
      DispatchStatus(
        salesInvoiceNo: salesInvoiceNo ?? this.salesInvoiceNo,
        date: date ?? this.date,
        status: status ?? this.status,
        discountpercentage: discountpercentage ?? this.discountpercentage,
        refDocNo: refDocNo ?? this.refDocNo,
        lrId: lrId ?? this.lrId,
        refDocDate: refDocDate ?? this.refDocDate,
        customerSiteId: customerSiteId ?? this.customerSiteId,
        transitDays: transitDays ?? this.transitDays,
        transitDueDate: transitDueDate ?? this.transitDueDate,
        transporterName: transporterName ?? this.transporterName,
        creditDueDate: creditDueDate ?? this.creditDueDate,
        orNo: orNo ?? this.orNo,
        agentName: agentName ?? this.agentName,
        commisionRate: commisionRate ?? this.commisionRate,
        totalGrossAmt: totalGrossAmt ?? this.totalGrossAmt,
        totalQty: totalQty ?? this.totalQty,
        totalValue: totalValue ?? this.totalValue,
        discount: discount ?? this.discount,
        freightCharges: freightCharges ?? this.freightCharges,
        basicValue: basicValue ?? this.basicValue,
        integratedGst: integratedGst ?? this.integratedGst,
        roundOff: roundOff ?? this.roundOff,
        netAmount: netAmount ?? this.netAmount,
        sgst: sgst ?? this.sgst,
        cgst: cgst ?? this.cgst,
        igst: igst ?? this.igst,
        others: others ?? this.others,
        bondNo: bondNo ?? this.bondNo,
        portCode: portCode ?? this.portCode,
        shippingBill: shippingBill ?? this.shippingBill,
        shippingBillDate: shippingBillDate ?? this.shippingBillDate,
        logisticsNo: logisticsNo ?? this.logisticsNo,
        declarationAmount: declarationAmount ?? this.declarationAmount,
        parcelid: parcelid ?? this.parcelid,
        lrDate: lrDate ?? this.lrDate,
        remarks: remarks ?? this.remarks,
        siteId: siteId ?? this.siteId,
        customerSiteName: customerSiteName ?? this.customerSiteName,
        details: details ?? this.details,
        parcelManagements: parcelManagements ?? this.parcelManagements,
        billContactNo: billContactNo ?? this.billContactNo,
        customerBillEmail: customerBillEmail ?? this.customerBillEmail,
        dispatchStatus: dispatchStatus ?? this.dispatchStatus,
        billAddress: billAddress ?? this.billAddress,
        customerBillGstin: customerBillGstin ?? this.customerBillGstin,
        customerBillGstState: customerBillGstState ?? this.customerBillGstState,
        shipAddress: shipAddress ?? this.shipAddress,
        customerShipGstin: customerShipGstin ?? this.customerShipGstin,
        customerShipGstState: customerShipGstState ?? this.customerShipGstState,
        agent: agent ?? this.agent,
        termName: termName ?? this.termName,
        siteAddress1: siteAddress1 ?? this.siteAddress1,
        customerName: customerName ?? this.customerName,
        siteContactMobile: siteContactMobile ?? this.siteContactMobile,
        siteWebsite: siteWebsite ?? this.siteWebsite,
        siteEmail: siteEmail ?? this.siteEmail,
        siteGstin: siteGstin ?? this.siteGstin,
        siteGstinState: siteGstinState ?? this.siteGstinState,
        siteCinNo: siteCinNo ?? this.siteCinNo,
        reportLogo: reportLogo ?? this.reportLogo,
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        isActive: isActive ?? this.isActive,
      );

  factory DispatchStatus.fromJson(Map<String, dynamic> json) => DispatchStatus(
    salesInvoiceNo: json["salesInvoiceNo"],
    date: json["date"],
    status: json["status"],
    discountpercentage: json["discountpercentage"],
    refDocNo: json["refDocNo"],
    lrId: json["lrId"],
    refDocDate: json["refDocDate"],
    customerSiteId: json["customerSiteId"],
    transitDays: json["transitDays"],
    transitDueDate: json["transitDueDate"],
    transporterName: json["transporterName"],
    creditDueDate: json["creditDueDate"],
    agentName: json["agentName"],
    commisionRate: json["commisionRate"],
    totalQty: json["totalQty"],
    totalValue: json["totalValue"],
    discount: json["discount"],
    orNo: json["orNo"],
    freightCharges: json["freightCharges"],
    basicValue: json["basicValue"],
    integratedGst: json["integratedGST"],
    totalGrossAmt: json["totalGrossAmt"],
    roundOff: json["roundOff"],
    netAmount: json["netAmount"],
    sgst: json["sgst"],
    cgst: json["cgst"],
    igst: json["igst"],
    others: json["others"],
    bondNo: json["bondNo"],
    dispatchStatus: json["dcStatus"],
    portCode: json["portCode"],
    shippingBill: json["shippingBill"],
    shippingBillDate: json["shippingBillDate"],
    logisticsNo: json["logisticsNo"],
    declarationAmount: json["declarationAmount"],
    parcelid: json["parcelid"],
    lrDate: json["lrDate"],
    remarks: json["remarks"],
    siteId: json["siteId"],
    customerSiteName: json["customer_site_name"],
    details: json["details"],
    parcelManagements: json["parcelManagements"],
    billContactNo: json["bill_contact_no"],
    customerBillEmail: json["customer_bill_email"],
    billAddress: json["billAddress"],
    customerBillGstin: json["customer_bill_gstin"],
    customerBillGstState: json["customer_bill_gst_state"],
    shipAddress: json["shipAddress"],
    customerShipGstin: json["customer_ship_gstin"],
    customerShipGstState: json["customer_ship_gst_state"],
    agent: json["agent"],
    termName: json["term_name"],
    siteAddress1: json["site_address1"],
    customerName: json["customer_name"],
    siteContactMobile: json["site_contact_mobile"],
    siteWebsite: json["site_website"],
    siteEmail: json["site_email"],
    siteGstin: json["site_gstin"],
    siteGstinState: json["site_gstin_state"],
    siteCinNo: json["site_CINNo"],
    reportLogo: json["report_logo"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"] == null ? null : DateTime.parse(json["modifiedOn"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "salesInvoiceNo": salesInvoiceNo,
    "date": date,
    "status": status,
    "discountpercentage": discountpercentage,
    "refDocNo": refDocNo,
    "lrId": lrId,
    "refDocDate": refDocDate,
    "customerSiteId": customerSiteId,
    "transitDays": transitDays,
    "transitDueDate": transitDueDate,
    "transporterName": transporterName,
    "creditDueDate": creditDueDate,
    "agentName": agentName,
    "commisionRate": commisionRate,
    "totalQty": totalQty,
    "totalValue": totalValue,
    "discount": discount,
    "freightCharges": freightCharges,
    "basicValue": basicValue,
    "integratedGST": integratedGst,
    "roundOff": roundOff,
    "netAmount": netAmount,
    "sgst": sgst,
    "cgst": cgst,
    "igst": igst,
    "others": others,
    "bondNo": bondNo,
    "portCode": portCode,
    "shippingBill": shippingBill,
    "shippingBillDate": shippingBillDate,
    "logisticsNo": logisticsNo,
    "declarationAmount": declarationAmount,
    "parcelid": parcelid,
    "lrDate": lrDate,
    "remarks": remarks,
    "siteId": siteId,
    "customer_site_name": customerSiteName,
    "details": details,
    "parcelManagements": parcelManagements,
    "bill_contact_no": billContactNo,
    "customer_bill_email": customerBillEmail,
    "billAddress": billAddress,
    "customer_bill_gstin": customerBillGstin,
    "customer_bill_gst_state": customerBillGstState,
    "shipAddress": shipAddress,
    "customer_ship_gstin": customerShipGstin,
    "customer_ship_gst_state": customerShipGstState,
    "agent": agent,
    "term_name": termName,
    "site_address1": siteAddress1,
    "customer_name": customerName,
    "site_contact_mobile": siteContactMobile,
    "site_website": siteWebsite,
    "site_email": siteEmail,
    "site_gstin": siteGstin,
    "site_gstin_state": siteGstinState,
    "site_CINNo": siteCinNo,
    "report_logo": reportLogo,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn?.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn?.toIso8601String(),
    "isActive": isActive,
  };
}
