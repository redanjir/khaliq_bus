// To parse this JSON data, do
//
//     final busStops = busStopsFromJson(jsonString);

import 'dart:convert';

BusStops busStopsFromJson(String str) => BusStops.fromJson(json.decode(str));

String busStopsToJson(BusStops data) => json.encode(data.toJson());

class BusStops {
    List<Value> value;

    BusStops({
        required this.value,
    });

    factory BusStops.fromJson(Map<String, dynamic> json) => BusStops(
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
    };
}

class Value {
    String busStopCode;
    String roadName;
    String description;
    double latitude;
    double longitude;

    Value({
        required this.busStopCode,
        required this.roadName,
        required this.description,
        required this.latitude,
        required this.longitude,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        busStopCode: json["BusStopCode"],
        roadName: json["RoadName"],
        description: json["Description"],
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "BusStopCode": busStopCode,
        "RoadName": roadName,
        "Description": description,
        "Latitude": latitude,
        "Longitude": longitude,
    };
}
