// To parse this JSON data, do
//
//     final notificationItem = notificationItemFromJson(jsonString);

import 'dart:convert';

List<NotificationItem> notificationItemFromJson(String str) => List<NotificationItem>.from(json.decode(str).map((x) => NotificationItem.fromJson(x)));

String notificationItemToJson(List<NotificationItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationItem {
  dynamic siteId;
  dynamic title;
  dynamic description;
  dynamic imageUrl;
  dynamic customerId;
  dynamic customerSiteId;
  dynamic status;
  dynamic customerSiteName;
  dynamic customerName;
  bool? isMirrorSync;
  dynamic id;
  dynamic createdBy;
  dynamic createdOn;
  dynamic modifiedBy;
  dynamic modifiedOn;
  bool? isActive;

  NotificationItem({
    this.siteId,
    this.title,
    this.description,
    this.imageUrl,
    this.customerId,
    this.customerSiteId,
    this.status,
    this.customerSiteName,
    this.customerName,
    this.isMirrorSync,
    this.id,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
  });

  NotificationItem copyWith({
    dynamic siteId,
    dynamic title,
    dynamic description,
    dynamic imageUrl,
    dynamic customerId,
    dynamic customerSiteId,
    dynamic status,
    dynamic customerSiteName,
    dynamic customerName,
    bool? isMirrorSync,
    dynamic id,
    dynamic createdBy,
    dynamic createdOn,
    dynamic modifiedBy,
    dynamic modifiedOn,
    bool? isActive,
  }) =>
      NotificationItem(
        siteId: siteId ?? this.siteId,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        customerId: customerId ?? this.customerId,
        customerSiteId: customerSiteId ?? this.customerSiteId,
        status: status ?? this.status,
        customerSiteName: customerSiteName ?? this.customerSiteName,
        customerName: customerName ?? this.customerName,
        isMirrorSync: isMirrorSync ?? this.isMirrorSync,
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        isActive: isActive ?? this.isActive,
      );

  factory NotificationItem.fromJson(Map<String, dynamic> json) => NotificationItem(
    siteId: json["siteId"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    customerId: json["customerId"],
    customerSiteId: json["customerSiteId"],
    status: json["status"],
    customerSiteName: json["customer_site_name"],
    customerName: json["customer_name"],
    isMirrorSync: json["isMirrorSync"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"],
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "siteId": siteId,
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
    "customerId": customerId,
    "customerSiteId": customerSiteId,
    "status": status,
    "customer_site_name": customerSiteName,
    "customer_name": customerName,
    "isMirrorSync": isMirrorSync,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
  };
}
