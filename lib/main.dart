import 'package:builder_demo/quote_model.dart';
import 'package:builder_demo/retrofit.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC"),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<QuoteModel> _buildBody(BuildContext context) {
    final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<QuoteModel>(

      future: client.getRandomQuote(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final QuoteModel quoteModel = snapshot.data!;
          return _builUI(context, quoteModel);
        } else if(snapshot.hasError) {
         return const Center(child: Text("Error", style: TextStyle(fontSize: 20),));
        }
        else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text("LOADING....", style: TextStyle(fontSize: 20, color: Colors.black54),),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _builUI(BuildContext context, QuoteModel model) {
    return Center(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(model.content ?? "Error", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    ));
  }


}
