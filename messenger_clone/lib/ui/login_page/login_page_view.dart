import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/login_page/login_page_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(viewModelBuilder: () => LoginPageViewModel(), builder: (context, model, child){
      return Stack(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            child: Image.asset("assets/backgrounds/rectangle.png", fit: BoxFit.fitWidth),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: AppStyle.appBarColor,
              title: Text("Login", style: TextStyle(color: Colors.black, fontSize: 25),),
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 70,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: SizedBox(
                        width: 100,
                        child: IconButton(onPressed:model.activeButton! ?  (){} : null, icon: Text("Done", style: TextStyle(color:model.activeButton! ? Colors.blue : Colors.grey.shade500, fontSize: 20),))),
                  )
                ],
            ),
            body: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                        Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: Text("Please enter your country code and", style: TextStyle(fontSize: 20),),
                  ),
                     ],
                   ),
                   const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("phone number", style: TextStyle(
                        fontSize: 20,
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration:  InputDecoration(border: InputBorder.none, label: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Phone"),
                          ),
                            focusColor: Colors.blue.shade300,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                            model.number = value;
                            model.activateButton();
                            },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: (){
                      model.takeToEmailLoginPage();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade500)
                      ),
                      child:  Center(
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 35),
                                child: HeroIcon(HeroIcons.mail, color: Colors.blue, size: 30,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: Text("Sign in using email", style: TextStyle(
                                  fontSize: 25,
                                ),),
                              )
                            ],
                          ),
                      ),
                    ),
                  )

                ],
              ),
            )
          ),
        ],
      );
    });
  }
}
