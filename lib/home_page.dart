import 'package:crypto_app/coin_list_page.dart';
import 'package:crypto_app/data/model/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      )),
    );
  }

  Future<void> getData() async {
    var response = await Dio().get(
        'https://rest.coincap.io/v3/assets?apiKey=2aa847df0149588f2d2ae871ade5da3cbfef39e0933d5aa91f7bb8b91c1bde93');
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => CoinListScreen(
          cryptoList: cryptoList,
        ),
      ),
    );
  }
}
