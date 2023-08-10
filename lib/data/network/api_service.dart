import 'package:dio/dio.dart';
import 'package:dio_package/data/models/companies/cars_model.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/constants/constants.dart';
import '../models/companies/car_model.dart';
import '../models/countries/data.dart';
import '../models/universal_data.dart';

class ApiService {
  // DIO SETTINGS
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  Future<UniversalData> getData() async {
    Response response;
    try {
      response = await dio.get('/countries',);
      if (response.statusCode == 200) {
        return UniversalData(data: Data.fromJson(response.data['data']));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        debugPrint(e.toString());
        return UniversalData(error: e.message!);
      }
    }catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getCompanies() async {
    Response response;
    try {
      response = await dio.get('/companies',);
      if (response.statusCode == 200) {
        return UniversalData(data: (response.data['data'] as List?)
            ?.map((e) => CarsModel.fromJson(e))
            .toList() ??
            []);
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        debugPrint(e.toString());
        return UniversalData(error: e.message!);
      }
    }catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getCar({required int carIndex}) async {
    Response response;
    try {
      response = await dio.get('/companies/$carIndex');
      if (response.statusCode == 200) {
        print(response.data);
        return UniversalData(data: CarModel.fromJson(response.data));
      }
      return UniversalData(error: "Other Error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        debugPrint(e.toString());
        return UniversalData(error: e.message!);
      }
    }catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}