part of 'product_datails_cubit.dart';

@immutable
sealed class ProductDatailsState {}

final class ProductDatailsInitial extends ProductDatailsState {}

final class GetRateLoading extends ProductDatailsState {}
final class GetRateSucsses extends ProductDatailsState {}
final class GetRateError extends ProductDatailsState {}



final class AddOrUpdateRateLoading extends ProductDatailsState {}
final class AddOrUpdateRateSucsses extends ProductDatailsState {}
final class AddOrUpdateRateError extends ProductDatailsState {}