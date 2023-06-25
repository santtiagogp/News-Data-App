import 'dart:convert';

import '../../ui/contants/news_api.dart';
import 'package:http/http.dart' as http;

class ApiManager {

  final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Future<dynamic> get( String endpoint ) async {

    dynamic jsonResp = {};

    try {
      
      final Uri url = Uri.parse( NewsApi.newsApi + endpoint );
      final http.Response resp = await http.get(url, headers: headers);
      final bool success = _validateSuccess(resp.statusCode);

      if( !success ) {
        throw Exception( 'status: ${resp.statusCode}, ${resp.body}' );
      }

      jsonResp = jsonDecode( resp.body );

      return jsonResp;

    } catch ( error ) {
      throw Exception( error.toString() );
    }

  }

  bool _validateSuccess( int status ) {

    bool success = true;

    if( status != 200 && status != 201 && status != 201 ) {
      success = false;
    }

    return success;

  }

}