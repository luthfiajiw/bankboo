import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/pages/banks/bank_profile_view.dart';
import 'package:bankboo/pages/banks/banks.dart';
import 'package:bankboo/pages/banks/banks_service.dart';
import 'package:bankboo/pages/banks/local_widgets/bank_tile.dart';
import 'package:bankboo/pages/banks/local_widgets/register_saving_book_instructions.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/app_bar_module.dart';
import 'package:bankboo/shared/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BanksView extends StatefulWidget {
  const BanksView({Key key}) : super(key: key);

  @override
  _BanksViewState createState() => _BanksViewState();
}

class _BanksViewState extends State<BanksView> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await Provider.of<BanksService>(context, listen: false).getBanks();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getBool('isNewUser') == true) {
        _showInstructions();
      }
    });
  }

  _showInstructions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RegisterSavingBookInstructionsModal(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            
            prefs.setBool('isNewUser', false);
            Navigator.pop(context);
          },
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarModule(
        context,
        title: 'Banks',
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Palette.textBlack, size: 20,),
            onPressed: (){}
          )
        ],
      ),
      body: Consumer<BanksService>(
        builder: (context, service, _) {
          int lengthData = service.banks.data != null
          ? service.banks.data.count != null ? service.banks.data.count : 0
          : 0;

          return service.isBusy
          ? Center(
            child: loading(context, color: Palette.secondary, size: 20, width: 45, height: 45)
          )
          : ListView.separated(
            itemCount: lengthData,
            separatorBuilder: (context, index) => Divider(color: Palette.textHint, indent: 20, endIndent: 20,), 
            itemBuilder: (context, index) {
              Bank bank = service.banks.data.results[index];

              return Column(
                children: [
                  BankTile(
                    title: bank.name,
                    registeredAsCust: bank.relationships.registeredAsCustomer,
                    margin: EdgeInsets.only(top: 15.0, bottom: 10),
                    fontSize: 16.0,
                    icon: BankbooLightIcon.university,
                    iconColor: Palette.g0,
                    number: bank.code,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.BankProfile,
                        arguments: BankProfileArgs(bank)
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      ),
    );
  }
}