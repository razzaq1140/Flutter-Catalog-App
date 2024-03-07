import 'package:catalog_app/Utilies/routes.dart';
import 'package:catalog_app/components/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: (context.canvasColor),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assests/login.png', fit: BoxFit.cover),
                SizedBox(height: 10,),
                "Welocom $name".text.color(context.primaryColor).xl3.make(),
                // Text(
                //   'Welcome $name',
                //   style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,color: (context.theme.primaryColor)),
                // ),
                const SizedBox(
                  height: 20,
                ),
                TextForm(
                  hint: 'Enter username',
                  label: 'Username',
                  validates: (value) {
                    if (value!.isEmpty) {
                      return 'Username cannot be empty';
                    } else
                       null;
                  },
                  onchange: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                TextForm(
                  hint: 'Enter password',
                  label: 'Password',
                  obsecur: true,
                  validates: (value) {
                    if (value!.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    else if(value.length < 6){
                      return 'Password length should be atleast 6';
                    }
                    else
                      null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if(_formKey.currentState!.validate()) {
                      print("hello");

                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      await Navigator.pushNamed(context, MyRoutes.home);
                      setState(() {
                        changeButton = false;
                      });
                      print("hello");
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                    height: 50.0,
                    width: changeButton ? 50 : 200,
                    child: changeButton
                        ? Icon(
                            Icons.done_outline_outlined,
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    decoration: BoxDecoration(
                      color: context.theme.hoverColor,
                      borderRadius: BorderRadius.circular(changeButton ? 50 : 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
