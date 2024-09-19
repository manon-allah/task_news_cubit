part of 'news_cubit_cubit.dart';

@immutable
sealed class NewsCubitState {}

final class NewsCubitInitial extends NewsCubitState {}


final class NewsSuccess extends NewsCubitState {}
