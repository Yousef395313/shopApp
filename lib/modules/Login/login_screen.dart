import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/Login/cubit/cubit.dart';
import 'package:shop_app/modules/Login/cubit/states.dart';
import 'package:shop_app/modules/register/register_screen.dart';
import 'package:shop_app/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit , ShopLoginStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Text(
                          "Login now to browse our hot offers",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please enter your Email adrees';
                            }
                          },
                          label: 'Email Adress',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          suffix: Icons.visibility,
                          onSubmit: (String value)
                          {
                            if(formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text
                              );
                            }
                          },
                          suffixPressed: (){},
                          type: TextInputType.visiblePassword,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Wrong password';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                            condition:true ,
                            builder: (context)=> defaultButton(
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              text: 'login',
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator())),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Don't have an account",
                            ),
                            Spacer(),
                            defaultTextButton(
                              function: ()
                              {
                                NavigateToFinish(context, RegisterScreen());
                              },
                              text: 'Register Now',
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
