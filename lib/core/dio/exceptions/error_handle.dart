import 'package:dio/dio.dart';
import 'package:marketplace/core/dio/exceptions/exceptions.dart';
import 'package:marketplace/core/dio/exceptions/failures.dart';

class ErrorHandle {
  Future<R> apiCantrol<T, R>(
      {required Future<Response<T>?> Function() request, required R Function(T response) body}) async {
    try {
      final response = await request();
      if (response!.statusCode! >= 200 && response.statusCode! < 300) {
        return body(response.data as T);
      } else if(response.statusCode! == 401) {
        //serviceLocator<AuthenticationBloc>().add(RefreshToken());
      }
      throw ServerException(
        statusCode: response.statusCode ?? 0,
        errorMessage: response.data is List && (response.data as List).isNotEmpty && (response.data as List)[0] is Map<String, dynamic> ? (response.data as List)[0]['message'].toString() : response.statusMessage ?? "",
      );
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
