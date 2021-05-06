import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dialog.dart';


class PrecoBitcoin extends StatefulWidget {

  @override
  _PrecoBitcoinState createState() => _PrecoBitcoinState();
}

class _PrecoBitcoinState extends State<PrecoBitcoin> {

  String _preco = "0";

  void _recuperarPreco() async{

    String url = "https://blockchain.info/ticker";

    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });

    print("Resultado: " + retorno.toString() );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(""),
        ),

        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset("image/bitcoin.png"),

                    Padding(padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                      child: Text(
                        "Preço: R\$ " + _preco,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      child: Text("Atualizar"),
                      style: ElevatedButton.styleFrom(

                        primary:  Color(0xFFF6921A),
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                        textStyle: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                      onPressed: _recuperarPreco,
                    ),

                    ElevatedButton(
                      child: Text("Dialog"),
                      style: ElevatedButton.styleFrom(

                        primary:  Color(0xFFF6921A),
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                        textStyle: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                      onPressed: (){
                        showDialog(context: context, builder: (context2) => Dialog1());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
