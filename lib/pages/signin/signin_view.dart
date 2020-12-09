import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/signin/signin_service.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/utils/string_extension.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:bankboo/shared/widgets/custom_outlined_button.dart';
import 'package:bankboo/shared/widgets/custom_textfield.dart';
import 'package:bankboo/shared/models/generic_fetch_error.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninView extends StatefulWidget {
  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final FocusNode pswFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final form = GlobalKey<FormState>();

  bool isFocus = false;
  Flushbar flush;

  @override
  void initState() {
    super.initState();
    // pswFocus.addListener(() {
    //   setState(() {
    //     isFocus = pswFocus.hasFocus;
    //   });
    // });
    emailFocus.addListener(() {
      setState(() {
        isFocus = emailFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    pswFocus.dispose();
    super.dispose();
  }

  void onSubmit(SigninService service) async {
    FocusScope.of(context).unfocus();
    
    if (form.currentState.validate()) {
      form.currentState.save();

      try {
        await service.getAccessToken();
        Navigator.pushReplacementNamed(context, RoutePaths.Home);
      } catch (e) {
        GenericFetchError error = GenericFetchError.fromJson(e.response.data);
        _showSnackbar(error);
        print(e);
        throw(e);
      }
    }
  }

  _showSnackbar(GenericFetchError error) {
    flush = Flushbar<bool>(
      backgroundColor: Colors.redAccent,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.info_outline, size: 16, color: Colors.white,),
          SizedBox(width: 5,),
          Text('${error.error.message.capitalize()}', style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,),
        ],
      ),
      animationDuration: Duration(milliseconds: 700),
      duration: Duration(seconds: 4),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: 8,
      isDismissible: true,
      margin: EdgeInsets.symmetric(horizontal: 15.0),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    
    return Consumer<SigninService>(
      builder: (context, service, _) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: form,
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/best-logo-new-green-512.png', scale: 15.0,),
                            Text('Bankboo', style: TextStyle(fontSize: 20, color: Palette.primary, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'Masukkan email kamu untuk untuk masuk atau buat akun baru.',
                                style: TextStyle(color: Palette.textBlack),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0),
                              child: CustomTextField(
                                hintText: 'Email',
                                autofocus: true,
                                prefixIcon: Icon(BankbooLightIcon.envelope, color: Palette.grey,),
                                focusNode: emailFocus,
                                onSaved: (value) => service.setEmail(value),
                                validator: (value) {
                                  if (value == '')
                                    return 'Email harus diisi';
                                  
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Button Actions
                    CustomFilledButton(
                      onPressed: () => Navigator.pushNamed(context, RoutePaths.Register),
                      label: 'Lanjut',
                      labelColor: Colors.white,
                      isLoading: service.isBusy,
                      color: Palette.secondary,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}