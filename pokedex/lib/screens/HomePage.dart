import 'package:flutter/material.dart';
import 'Nama.dart';
import '../main.dart';
import '../constants.dart';
import 'Detail.dart';
import '../components/Button.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: Text('Pokedex gen-1'),
      ),

      body: Row(children: [
        Expanded(
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/1.png'
          )
          ),

        Expanded(
          child: FutureBuilder (
            future: getNamas(),
            initialData: [],
            builder: (context, snashot) {
              return namas;
            },
            
          )),

        Expanded(
          child:MyButton ),  
      ],)
    
      



  }
}




