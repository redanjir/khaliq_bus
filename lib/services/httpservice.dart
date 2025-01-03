import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/BusStops.dart';
import '../models/BusArrival.dart';

class HttpService{

 //Get all bus stops
 static Future<List<Value>?> getBusStops() async{
    String url = 'https://datamall2.mytransport.sg/ltaodataservice/BusStops';
    var uri = Uri.parse(url);
    try{
      final response = await http.get(uri, headers:{
        'AccountKey':'4AfguyUyQl+oHHx9fugAcg==',
        'accept':'application/json'
      });

      if(response.statusCode == 200){
        final BusStops bs = busStopsFromJson(response.body);
        return bs.value;
      }else{
        return [];
      }
    }catch(e){
      debugPrint('Error ${e.toString()}');
      return [];
    }
  }

 //Get bus arrival by bus stop
 static Future<List<Service>?> getBusArrival({required int busStopCode}) async{
    String url = 'https://datamall2.mytransport.sg/ltaodataservice/v3/BusArrival?BusStopCode=$busStopCode';
    var uri = Uri.parse(url);
    try{
      final response = await http.get(uri, headers:{
        'AccountKey':'4AfguyUyQl+oHHx9fugAcg==',
        'accept':'application/json'
      });

      if(response.statusCode == 200){
        final BusArrival ba = busArrivalFromJson(response.body);
        return ba.services;
      }else{
        return [];
      }
    }catch(e){
      debugPrint('Error ${e.toString()}');
      return [];
    }
  }
}