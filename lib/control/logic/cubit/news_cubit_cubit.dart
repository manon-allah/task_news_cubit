import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_with_cubit/control/data/online/dio_helper.dart';
import 'package:news_with_cubit/control/data/online/end_points.dart';
import 'package:news_with_cubit/model/news_model.dart';

part 'news_cubit_state.dart';

class NewsCubitCubit extends Cubit<NewsCubitState> {
  NewsCubitCubit({required this.dioHelper}) : super(NewsCubitInitial());
  final DioHelper? dioHelper;
  NewsModel? bbcModel;

  Future<Future<Response>?> getBbcNews() async {
    try {
      return dioHelper?.getData(url: '$newsBBcList=$apiKey').then((value) {
        print(value);
        if (value.data != null) {
          print(value.data);
          bbcModel = NewsModel.fromJson(value.data);
          emit(NewsSuccess());
        }
      });
    } catch (e) {
      print('BBC Error =========> $e');
    }
  }
}
