import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/login_page/email_login_page/email_login_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:messenger_clone/widgets/text_fields/empty_textField/empty_textField.dart';
import 'package:messenger_clone/widgets/text_fields/filled_textField/filled_textField.dart';
import 'package:stacked/stacked.dart';

class EmailLoginView extends StatelessWidget {
  const EmailLoginView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailLoginViewModel>.reactive(
        viewModelBuilder: () => EmailLoginViewModel(),
        builder: (context, model, child) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/backgrounds/rectangle.png",
                    fit: BoxFit.fitWidth),
              ),
              Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: AppStyle.appBarColor,
                  title: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  centerTitle: true,
                  toolbarHeight: 70,
                  leading: IconButton(
                    onPressed: model.popPage,
                    icon: HeroIcon(
                      HeroIcons.backward_arrow,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                body: Center(
                    child: SizedBox(
                  height: 450,
                  width: 350,
                  child: Card(
                    child: Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                        width: 260,
                                        child: FilledTextField(
                                          label: "Email",
                                          validator: (val) {
                                            if (val!.trim().isEmpty) {
                                              return 'Please enter email address.';
                                            } else if (!RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val.trim())) {
                                              return 'Please enter valid email address';
                                            }
                                          },
                                          onChanged: (value) {
                                            model.email = value!;
                                          },
                                          obscureText: false,
                                          pass: false,
                                        ))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 40, left: 20),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.password,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                            width: 260,
                                            child: FilledTextField(
                                                label: "Password",
                                                obscureText: model.showPass,
                                                pass: true,
                                                onSuffixPressed:
                                                    model.changeShowPass,
                                                suffix: model.showPass
                                                    ? const HeroIcon(
                                                        HeroIcons.eye_off,
                                                        color: Colors.black,
                                                        size: 20,
                                                      )
                                                    : const HeroIcon(
                                                        HeroIcons.eye,
                                                        size: 20,
                                                        color: Colors.blue,
                                                      ),
                                                onChanged: (value) {
                                                  model.password = value!;
                                                },
                                                validator: (value) {
                                                  if (value!.length < 6) {
                                                    return "Password too short";
                                                  }
                                                }),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 150,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          model.takeToBaseView(_key);
                                        },
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Don't have an account? "),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 40,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: model.takeToSignUpPage,
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blue.shade300,
                                            elevation: 0),
                                      ))
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                )),
              )
            ],
          );
        });
  }
}
