import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/sign_up_page/sign_up_page_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:messenger_clone/widgets/text_fields/filled_textField/filled_textField.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpPageViewModel>.reactive(
      viewModelBuilder: () => SignUpPageViewModel(),
      builder: (context, model, child) {
        return Stack(
          children: [
            SizedBox(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/backgrounds/rectangle.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(
        onPressed: model.popPage,
        icon: HeroIcon(
        HeroIcons.backward_arrow,
        color: Colors.grey.shade500,
        ),
        ),
                title: Text('Sign up', style: TextStyle(color: Colors.black, fontSize: 25),),
                centerTitle: true,
                toolbarHeight: 70,
                backgroundColor: AppStyle.appBarColor,
                elevation: 0,
              ),
              body: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: 500,
                  ),
                  width: 350,
                  child: Form(
                    key: _key,
                    child: Card(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 260,
                                child: FilledTextField(
                                    label: "Name",
                                    obscureText: false,
                                    pass: false,
                                    onChanged: (value) {
                                      model.name = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "*required field";
                                      }
                                    }),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 20),
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
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              )),
                          Padding(
                              padding:
                              const EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                        label: "Confirm Password",
                                        obscureText: model.showConfPass,
                                        pass: true,
                                        onSuffixPressed:
                                        model.changeConfPass,
                                        suffix: model.showConfPass
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
                                          model.confPassword = value!;
                                        },
                                        validator: (value) {
                                          if (value != model.password) {
                                            return "Passwords do not match";
                                          }
                                        }),
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 40,
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
                                    onPressed: (){
                                      model.takeToBasePage(_key);
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        elevation: 0),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
