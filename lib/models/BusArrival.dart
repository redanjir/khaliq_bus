// To parse this JSON data, do
//
//     final busArrival = busArrivalFromJson(jsonString);

import 'dart:convert';

BusArrival busArrivalFromJson(String str) => BusArrival.fromJson(json.decode(str));

String busArrivalToJson(BusArrival data) => json.encode(data.toJson());

class BusArrival {
    String busStopCode;
    List<Service> services;

    BusArrival({
        required this.busStopCode,
        required this.services,
    });

    factory BusArrival.fromJson(Map<String, dynamic> json) => BusArrival(
        busStopCode: json["BusStopCode"],
        services: List<Service>.from(json["Services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "BusStopCode": busStopCode,
        "Services": List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Service {
    String serviceNo;
    String serviceOperator;
    NextBus nextBus;
    NextBus nextBus2;
    NextBus nextBus3;

    Service({
        required this.serviceNo,
        required this.serviceOperator,
        required this.nextBus,
        required this.nextBus2,
        required this.nextBus3,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceNo: json["ServiceNo"],
        serviceOperator: json["Operator"],
        nextBus: NextBus.fromJson(json["NextBus"]),
        nextBus2: NextBus.fromJson(json["NextBus2"]),
        nextBus3: NextBus.fromJson(json["NextBus3"]),
    );

    Map<String, dynamic> toJson() => {
        "ServiceNo": serviceNo,
        "Operator": serviceOperator,
        "NextBus": nextBus.toJson(),
        "NextBus2": nextBus2.toJson(),
        "NextBus3": nextBus3.toJson(),
    };
}

class NextBus {
    String originCode;
    String destinationCode;
    DateTime estimatedArrival;
    int monitored;
    String latitude;
    String longitude;
    String visitNumber;
    String load;
    String feature;
    String type;

    NextBus({
        required this.originCode,
        required this.destinationCode,
        required this.estimatedArrival,
        required this.monitored,
        required this.latitude,
        required this.longitude,
        required this.visitNumber,
        required this.load,
        required this.feature,
        required this.type,
    });

    factory NextBus.fromJson(Map<String, dynamic> json) => NextBus(
        originCode: json["OriginCode"],
        destinationCode: json["DestinationCode"],
        estimatedArrival: DateTime.parse(json["EstimatedArrival"]),
        monitored: json["Monitored"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        visitNumber: json["VisitNumber"],
        load: json["Load"],
        feature: json["Feature"],
        type: json["Type"],
    );

    Map<String, dynamic> toJson() => {
        "OriginCode": originCode,
        "DestinationCode": destinationCode,
        "EstimatedArrival": estimatedArrival.toIso8601String(),
        "Monitored": monitored,
        "Latitude": latitude,
        "Longitude": longitude,
        "VisitNumber": visitNumber,
        "Load": load,
        "Feature": feature,
        "Type": type,
    };
}
