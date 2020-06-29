import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/signin/signin_service.dart';
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
    pswFocus.addListener(() {
      setState(() {
        isFocus = pswFocus.hasFocus;
      });
    });
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
        throw(e);
      }
    }
  }

  _showSnackbar(GenericFetchError error) {
    flush = Flushbar<bool>(
      backgroundColor: Colors.redAccent,
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('${error.error.message.capitalize()}', style: TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center,),
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
        body: SafeArea(
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: form,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AnimatedContainer(
                          height: isFocus ? 0 : 100,
                          duration: Duration(milliseconds: 250),
                          child: Hero(
                            tag: 'splash_logo',
                            child: Image.asset('lib/assets/best-logo-new-green-512.png', scale: 5.0,)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: isFocus ? 5.0 : 32.0),
                          child: Text('Masuk Akun Bankboo', style: Theme.of(context).textTheme.title,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: CustomTextField(
                            label: 'Email',
                            focusNode: emailFocus,
                            onSaved: (value) => service.setEmail(value),
                            validator: (value) {
                              if (value == '')
                                return 'Email harus diisi';
                              
                              return null;
                            },
                          ),
                        ),
                        CustomTextField(
                          label: 'password',
                          focusNode: pswFocus,
                          onSaved: (value) => service.setPassword(value),
                          validator: (value) {
                            if (value == '') {
                              return 'Password harus diisi';
                            } else if (value.length < 6) {
                              return 'Panjang password minimal 6 karakter';
                            }
                            
                            return null;
                          },
                        )
                      ],
                    ),

                    // Button Actions
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CustomFilledButton(
                            onPressed: () => onSubmit(service),
                            label: 'Masuk',
                            labelColor: Colors.white,
                            isLoading: service.isBusy,
                            color: Palette.secondary,
                          ),
                        ),
                        CustomOutlineButton(
                          onPressed: () {},
                          label: 'Buat Akun',
                          labelColor: Palette.textBlack,
                          color: Palette.borderDefault,
                        )
                      ],
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