import 'package:bankboo/pages/banks/banks.dart';
import 'package:bankboo/pages/banks/banks_service.dart';
import 'package:bankboo/pages/banks/local_widgets/bank_tile.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/app_bar_module.dart';
import 'package:bankboo/shared/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BanksView extends StatefulWidget {
  const BanksView({Key key}) : super(key: key);

  @override
  _BanksViewState createState() => _BanksViewState();
}

class _BanksViewState extends State<BanksView> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async => await Provider.of<BanksService>(context).getBanks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarModule(
        context,
        title: 'Banks',
        onPop: () => Navigator.pop(context),
        actions: <Widget>[
          IconButton(
            icon: Icon(BankbooLightIcon.search, color: Palette.textBlack, size: 16,),
            onPressed: (){}
          )
        ],
      ),
      body: Consumer<BanksService>(
        builder: (context, service, _) {
          int lengthData = service.banks.data.count != null ? service.banks.data.count : 0;

          return service.isBusy
          ? Center(
            child: loading(context, color: Palette.secondary, size: 20, width: 45, height: 45)
          )
          : ListView.separated(
            itemCount: lengthData,
            separatorBuilder: (context, index) => Divider(color: Palette.textHint.withOpacity(0.2), indent: 20, endIndent: 20,), 
            itemBuilder: (context, index) {
              Bank bank = service.banks.data.results[index];

              return BankTile(
                title: bank.name,
                margin: EdgeInsets.only(top: 15.0, bottom: 10),
                fontSize: 16.0,
                icon: BankbooLightIcon.university,
                iconColor: Palette.secondary,
                number: bank.code,
              );
            },
          );
        }
      ),
    );
  }
}