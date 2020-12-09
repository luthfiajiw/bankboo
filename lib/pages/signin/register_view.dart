import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/signin/local_widgets/confirmation_pin_field.dart';
import 'package:bankboo/pages/signin/local_widgets/new_pin_field.dart';
import 'package:bankboo/pages/signin/local_widgets/user_register_field.dart';
import 'package:bankboo/pages/signin/signin_service.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:bankboo/shared/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with TickerProviderStateMixin{
  TextEditingController newPinController = TextEditingController();
  TextEditingController confirmationPinController = TextEditingController();
  int step = 1;
  String btnLabel = 'Lanjut';
  Animation<Offset> step1Offset;
  AnimationController step1Animation;
  Animation<Offset> step2Offset;
  AnimationController step2Animation;
  Animation<Offset> step3Offset;
  AnimationController step3Animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  initAnimation() {
    setState(() {
      step1Animation= AnimationController(vsync: this, duration: Duration(milliseconds: 500));
      step1Offset = Tween<Offset>(begin: Offset.zero, end: Offset(-1.5, 0.0)).animate(step1Animation);

      step2Animation= AnimationController(vsync: this, duration: Duration(milliseconds: 500));
      step2Offset = Tween<Offset>(begin: Offset(1.5, 0.0), end: Offset.zero).animate(step2Animation);

      step3Animation= AnimationController(vsync: this, duration: Duration(milliseconds: 500));
      step3Offset = Tween<Offset>(begin: Offset(1.5, 0.0), end: Offset.zero).animate(step3Animation);
    });
  }

  handleTransition() {
    switch (step) {
      case 1:
        setState(() {
          step1Offset = Tween<Offset>(begin: Offset(1.5, 0.0), end: Offset.zero).animate(step1Animation);
        });
        step2Animation.forward();
        setState(() {
          step = 2;
        });
        break;
      case 2:
        step3Animation.forward();
        setState(() {
          step2Offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0.0)).animate(step2Animation);
          step = 3;
          btnLabel = 'Selesai';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninService>(
      builder: (context, service, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/best-logo-new-green-512.png', scale: 15.0,),
                            Text('Bankboo', style: TextStyle(fontSize: 20, color: Palette.primary, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Text('$step/3', style: TextStyle(color: Palette.textHint),),
                        SizedBox(height: 15,),
                        Stack(
                          children: [
                            SlideTransition(
                              position: step3Offset,
                              child: ConfirmationPinField(),
                            ),
                            SlideTransition(
                              position: step2Offset,
                              child: NewPinField(
                                newPinController: newPinController,
                              ),
                            ),
                            SlideTransition(
                              position: step1Offset,
                              child: UserRegisterField()
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomFilledButton(
                      label: btnLabel,
                      labelColor: Colors.white,
                      isLoading: service.isBusy,
                      color: Palette.secondary,
                      onPressed: () {
                        if (step < 3) {
                          handleTransition();
                        } else {
                        }
                      },
                    )
                  ],
                ),
              )
            )
          ),
        );
      },
    );
  }
}