
import 'package:dio/dio.dart';
abstract class DioHelper {
  Future<Response> postData({
    required String url,
    dynamic data,
    String token,
  });

  Future<Response> putData({
    required String url,
    required dynamic data,
    String token,
  });

  Future<Response> getData({required String url, dynamic data, String token ,dynamic param});

  Future<Response> delete({
    required String url,
    String token,
  });
}

class DioImplementation extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      receiveDataWhenStatusError: true,
      queryParameters: {

      },
      validateStatus: (statusCode){
        if(statusCode == null){
          return false;
        }
        if(statusCode == 422){ // your http status code
          return true;
        }else{
          return statusCode >= 200 && statusCode < 300;
        }
      },
    ),
  );

  @override
  Future<Response> postData({
    String? url,
    String? token,
    dynamic data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.post(
      url!,
      data: data,
      queryParameters: {

      },
    );
  }

  @override
  Future<Response> putData({
    String? url,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };

    return await dio.put(
      url!,
      data: data,
      queryParameters: {

      },
    );
  }

  @override
  Future<Response> getData({
    String? url,
    dynamic data,
    String? token,
    dynamic param
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'accept': 'application/json'
    };

    return await dio.get(
        url!,
        queryParameters: param
    );
  }

  @override
  Future<Response> delete({String? url, String? token}) async {
    dio.options.headers = {

    };

    return await dio.delete(
      url!,
      queryParameters: {

      },
    );
  }
}
