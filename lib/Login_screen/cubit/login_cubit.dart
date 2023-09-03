import 'package:bloc/bloc.dart';
import 'package:day4/Login_screen/Model/LoginModel.dart';
import 'package:day4/helper/DioHelper.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  DioHelper dioHelper=DioHelper();
  LoginModel loginModel=LoginModel();

  void login({required String email
    ,required String password})
  async{
      emit(LoginLoadingState());
      try{
        final response=await DioHelper.postdata(
          path: "login",
          body: {
            "email":email,
            "password":password
          }
        );
        loginModel=LoginModel.fromJson(response.data);
        if(loginModel.status==true){
          emit(LoginSuccessState());
        }else{
          emit(LoginErrorState());
        }
      }catch(e){
        emit(LoginErrorState());
      }
    

  }

}
