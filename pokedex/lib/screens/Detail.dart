import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:ffi';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Detail>> getDetails() async{
  final response=
    await http.get('https://pokeapi.co/api/v2/pokemon/1');

  if (response.statusCode == 200) {
    var parsedDetailList = json.decode(response.body);
    List<Detail> details = List<Detail>();
    
    parsedDetailList.forEach((detail){
      details.add(Detail.fromJson(detail));
    });
    return details; 
  } else {
    throw Exception ('Failed to load data');
  }
}

class Detail {
    Detail({
      @required this.num,
      @required this.name,
      @required this.types,
      @required this.height,
      @required this.weight,
      @required this.moves,
      @required this.sprites});
  final int num;
  final String name;
  final List<String> types;
  final double height;
  final double weight;
  final String sprites;
  final List<String> moves;


  factory Detail.fromJson(Map<String, dynamic> json) {
    List<String> _types = (json['types'] as List)
        .map((data) => data['type']['name'].toString())
        .toList();
    List<String> _moves = (json['moves'] as List)
        .map((data) => data['move']['name'].toString())
        .toList();

    return Detail(
        num: json['id'],
        name: json['name'],
        types: _types,
        height: double.parse(json["height"].toString()),
        weight: double.parse(json["weight"].toString()),
        sprites: json['sprites']['front_default'],
        moves: _moves);
  }
}