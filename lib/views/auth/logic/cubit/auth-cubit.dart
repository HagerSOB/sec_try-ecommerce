import 'dart:developer';
import 'package:ecommerce/views/auth/logic/cubit/auth-state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCubit extends Cubit<AuthenState>{
  SupabaseClient client =Supabase.instance.client;

  AuthCubit():super(AuthInitialState()){
    monitorAuthState();
  }
  void monitorAuthState() {
    client.auth.onAuthStateChange.listen((data) async {
      final Session? session = data.session;
      final AuthChangeEvent event = data.event;

      log("Auth Event detected: $event"); // لمراقبة الحالة في الـ Console

      // التعديل هنا: بنسمح بحدث الـ signedIn والـ initialSession (عشان الويب)
      if (session?.user != null &&
          (event == AuthChangeEvent.signedIn || event == AuthChangeEvent.initialSession)) {

        final user = session!.user;

        // بنضيف تأخير بسيط عشان نضمن إن الـ Session استقر تماماً قبل ما نكلم الداتابيز
        Future.delayed(const Duration(milliseconds: 500), () async {
          try {
            await AddUsersToData(
              Name: user.userMetadata?['full_name'] ?? 'Google User',
              Email: user.email ?? '',
            );

            if (!isClosed) emit(GoogleSignInSuccses());
            log("Data synced successfully from Listener");
          } catch (e) {
            log("Error syncing data: $e");
          }
        });
      }
    });
  }
  ;;

  Future<void> login({required email,required password})async {
    emit(LoginLoading());
    try{
      await client.auth.signInWithPassword(password: password,email: email );
      emit(LoginSuccses());

    }on AuthApiException catch(e) {
      log(e.toString());
      emit(LoginError(e.message));

    }
    catch(e){
      emit(LoginError(e.toString()));
    }

  }
  Future<void> Register({required String name ,required email,required password})async {
    emit(SignUpLoading());
    try{
      await client.auth.signUp(password: password,email: email,data: {'name':name} );
      await AddUsersToData(Name: name, Email: email);
      emit(SignUpSuccses());

    }on AuthApiException catch(e) {
      log(e.toString());
      log(e.toString());



      emit(SignUpError(e.message));

    }
    catch(e){
      emit(SignUpError(e.toString()));
    }

  }
// الدالة الجديدة والسهلة للويب
 /* Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      // السطر السحري اللي بيفتح صفحة جوجل ويرجعك أوتوماتيك
      await client.auth.signInWithOAuth(
        OAuthProvider.google,
        // في الويب سوبابيز بيعرف الـ Redirect لوحده من الـ Dashboard
        redirectTo: kIsWeb ? 'http://localhost:54321/' : null,      );

      // ملاحظة: في الويب، الكود غالباً بيقف هنا لأن الصفحة بتعمل Refresh
      // والـ Session بيتسجل لوحده أول ما ترجعي
      emit(GoogleSignInSuccses());

    } catch (e) {
      log("Google Sign In Error: $e");
      emit(GoogleSignInError( error:e.toString()));
    }*/

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      await client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: kIsWeb ? 'http://localhost:62847/' : null,
        authScreenLaunchMode: LaunchMode.externalApplication,
      );

      final user = client.auth.currentUser;

      if (user != null) {
        await AddUsersToData(
          Name: user.userMetadata?['full_name'] ?? 'Google User',
          Email: user.email ?? '',
        );
        emit(GoogleSignInSuccses());
        print("تم تسجيل الدخول وإضافة البيانات بنجاح!");
      }

    } catch (e) {
      log("Google Error: $e");
      emit(GoogleSignInError(error: e.toString()));
    }
  }
  Future<void> signOut() async {
    emit(LogOutLoading());
    try {
      await client.auth.signOut();
      emit(LogOutSuccses());
    } catch (e) {
      print("Error during sign out: $e");
      emit(LogOutError(error: e.toString()));
    }
  }
Future<void> ForgetPass({required String email})async {
    emit(ResetPassLoading());
    try{
  await client.auth.resetPasswordForEmail(email);
  emit(ResetPassSuccses());
  print("  تم تغييير  الباسورد");

    }
        catch (e){
      emit(ResetPassError(error: e.toString()));

        }

}
Future <void> AddUsersToData({required String Name,required String Email}) async{
    emit( UserDataAddLoading());
    try{ await client.from('Users').upsert({
      'User-id': client.auth.currentUser!.id,
      'Name': Name,
      'Email': Email,
    }, onConflict: 'User-id');
      emit(UserDataAddSuccses());
    log("User Data Synced Successfully");
    }
    catch (e){
      log(e.toString());
emit(UserDataAddError(error: e.toString()));
    }



}
}
