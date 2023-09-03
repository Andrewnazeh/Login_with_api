import 'package:day4/Login_screen/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Container(
          width: double.infinity,
          child: Center(
             child: Padding(padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              child:SingleChildScrollView(
                child:Column(
                  children: [
                    SizedBox(height: 130,),
                    Text("Your Logo",
                      style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                    SizedBox(height: 80,),
                    Container(
                      height: 550,
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ,color:Colors.white ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Create an account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                            SizedBox(height: 10,),
                            Text("sign up to continue",style:TextStyle(color: Colors.grey,fontSize: 15,)),
                            SizedBox(height: 30,),
                            Text("NAME",style:TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                            TextField(obscureText: true,keyboardType: TextInputType.text,
                              decoration: InputDecoration(hintText: "Davin Wong",
                                  filled: true   ),
                            ),
                            SizedBox(height: 20,),
                            Text("EMAIL",style:TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                            TextField(controller: _emailController,onChanged: (value) {
                            },obscureText: true,keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(hintText: "dvin.wong@gmail.com",
                                  filled: true ,suffixIcon: (IconButton(icon: Icon(Icons.verified_outlined),onPressed: (){},))  ), ),
                            SizedBox(height: 20,),
                            Text("PASSWORD",style:TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                            TextField(controller: _passwordController,obscureText: true,
                              decoration: InputDecoration(
                                  filled: true   ,suffixIcon: (IconButton(icon: Icon(Icons.password_outlined),onPressed: (){},))),),
                            SizedBox(height: 50,),
                            BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  if(state is LoginLoadingState){
                                    return Center(child: CircularProgressIndicator(),);
                                  }
                                  return InkWell(
                                    onTap: (){
                                      if(_formKey.currentState!.validate()){
                                        context.read<LoginCubit>().login(email: _emailController.text,
                                            password: _passwordController.text);
                                      }
                                    },
                                    child: Container(width: 350,height: 60,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.green ),
                                           child: Center(child: Text("Get start",style: TextStyle(color:Colors.white),)),),
                                             );
                                          },
                                        ),
                            SizedBox(height: 20,),

                            Row(mainAxisSize: MainAxisSize.min,children: [
                              SizedBox(width: 60,),
                              Text("Already have an account?  Login",style: TextStyle(color: Colors.grey),)
                            ],),
                          ],
                        ),
                      ),)
                  ],) ,) ,),
          ),)
    );
  }
}