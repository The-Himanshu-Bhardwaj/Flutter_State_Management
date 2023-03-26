import 'package:builder_demo/quote_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit.g.dart';


@RestApi(baseUrl: "https://api.quotable.io/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("random")
  Future<QuoteModel> getRandomQuote();
}