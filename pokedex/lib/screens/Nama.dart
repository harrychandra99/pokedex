import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Nama>> getNamas() async{
  final response=
    await http.get('pokeapi.co/api/v2/pokemon?limit=151');

  if (response.statusCode == 200) {
    var parsedNamaList = json.decode(response.body);
    List<Nama> namas = List<Nama>();
    
    parsedNamaList.forEach((nama){
      namas.add(Nama.fromJson(nama));
    });
    return namas; 
  } else {
    throw Exception ('Failed to load data');
  }
}

class Nama {
  Nama({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
    @required this.name,
    @required this.url,
  });

  final Double count;
  final String next;
  final String previous;
  final String results;
  final String name;
  final String url;

  factory Nama.fromJson(Map<String, dynamic> json)  {
    return Nama(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'],
      name: json['results']['name'],
      url: json['results']['url'],
    );
  }
}





