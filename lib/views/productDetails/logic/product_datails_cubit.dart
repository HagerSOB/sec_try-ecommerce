import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_services.dart';
import 'package:ecommerce/views/productDetails/modles/rate_modle.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_datails_state.dart';

class ProductDatailsCubit extends Cubit<ProductDatailsState> {
  ProductDatailsCubit() : super(ProductDatailsInitial());
 final ApiServices _apiServices =ApiServices();
  List<RateModel> rates=[];
  int userRate=5;
  int avrageRate=0;
  String userId  =Supabase.instance.client.auth.currentUser!.id;
   Future<void> getRates({required String productId})async{
     emit(GetRateLoading());
      try{
        rates = [];
      Response response=  await _apiServices.getData("rates_table?select=*&for_product=eq.$productId");
      for(var rate in response.data)rates.add(RateModel.fromJson(rate));


      _getAvrageRate();
    List<RateModel> userRates= rates.where((RateModel rate)=> rate.forUser==userId).toList();
    if(userRates.isNotEmpty)
      {
        userRate=userRates[0].rate;
      }
    else{
      userRate=5;
    }
      log("UserRates length=${userRates.length}");

      log("Rate.ForUser=${userRates[0].forUser}");

      log("UserID = ${userId}");
    log("UserRate is ${userRate}");

emit(GetRateSucsses());
      }
          catch(e){
log(e.toString());
emit(GetRateError());
          }
   }

   void _getAvrageRate() {
     avrageRate = 0;
      for(var userRate in rates)
       {
         if(userRate!=null){
           avrageRate+=userRate.rate;
         }
       }
      if(rates.isNotEmpty){
       avrageRate=(avrageRate/rates.length).toInt();

     }
   }

  bool _IsUserRateExist({required String productId}) {
    for (var rate in rates) {
      if ((rate.forUser == userId) && (rate.forProduct == productId)) {
        return true;
      }
    }
    return false;
  }
   Future<void> addORUpdateUsrRate({required String productId,required Map<String,dynamic> data })async{
    String path ="rates_table?for_product=eq.$productId&for_user=eq.$userId";
     emit(AddOrUpdateRateLoading());
     try{
       if(_IsUserRateExist(productId: productId)) {
await _apiServices.patchData(path, data);
       }
       else{
         await _apiServices.postData(path, data);
       }

emit(AddOrUpdateRateSucsses());
     }catch (e){
       log(e.toString());
       emit(AddOrUpdateRateError());
     }
   }
}
