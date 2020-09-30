import 'package:bloc_test/network/model/task_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';


part 'api_service.g.dart';
@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET('photos')
  Future<List<TaskModel>> getTasks();

  @GET('/{id}')
  Future<List<TaskModel>> getTask(@Path('id') int id);

}