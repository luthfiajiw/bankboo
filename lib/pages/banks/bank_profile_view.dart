import 'package:bankboo/pages/banks/models/banks.dart';
import 'package:bankboo/pages/banks/banks_service.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/app_bar_module.dart';
import 'package:bankboo/shared/widgets/custom_filled_button.dart';
import 'package:bankboo/shared/widgets/lozenges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankProfileArgs {
  final Bank bank;

  BankProfileArgs(this.bank);
}

class BankProfileView extends StatefulWidget {
  final Bank bank;

  const BankProfileView({Key key, this.bank}) : super(key: key);

  @override
  _BankProfileViewState createState() => _BankProfileViewState();
}

class _BankProfileViewState extends State<BankProfileView> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<BanksService>(context, listen: false).setBank(widget.bank);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarModule(
        context,
        title: 'Profil Bank',
      ),
      body: Consumer<BanksService>(
        builder: (context, service, _) => Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 235,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/bg-bank-profile.jpg'),
                        fit: BoxFit.fitWidth
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 190, 15, 15) ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              image: AssetImage('lib/assets/bank-avatar.jpg'),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white, width: 3)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: Text(
                            '${service.bank.code}',
                            style: TextStyle(color: Palette.textHint),
                          ),
                        ),
                        Text(
                          '${service.bank.name}',
                          style: TextStyle(fontSize: 16, color: Palette.textBlack, fontWeight: FontWeight.w600),
                        ),
                        Visibility(
                          visible: service.bank.relationships.registeredAsCustomer || service.bank.relationships.waitingForApproval,
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 5),
                            child: Lozenges(
                              status: service.bank.relationships.waitingForApproval ? 'Menunggu Persetujuan' : 'Terdaftar',
                              color: service.bank.relationships.waitingForApproval ? Palette.secondary : Palette.primary,
                              bgColor: service.bank.relationships.waitingForApproval ? Palette.statusSecondary : Palette.statusSucceed,
                            ),
                          ),
                        )
                        
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: TextStyle(fontSize: 16, color: Palette.textBlack, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'Ceritanya ini adalah deskripsi dari bang yang bersangkutan, diisi aja biar keliatan bagus.',
                      style: TextStyle(color: Palette.textBlack),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'No. Handphone',
                      style: TextStyle(fontSize: 16, color: Palette.textBlack, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      '${service.bank.phone}',
                      style: TextStyle(color: Palette.textBlack),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Alamat',
                      style: TextStyle(fontSize: 16, color: Palette.textBlack, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      '${service.bank.address ?? '-'}',
                      style: TextStyle(color: Palette.textBlack),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Consumer<BanksService>(
        builder: (context, service, _) => Visibility(
          visible: !service.bank.relationships.registeredAsCustomer && !service.bank.relationships.waitingForApproval,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: CustomFilledButton(
              isLoading: service.isBusy,
              label: 'Daftar Menjadi Nasabah',
              labelColor: Colors.white,
              color: Palette.secondary,
              onPressed: () => service.registerBankCustomer(service.bank.id),
            ),
          ),
        ),
      ),
    );
  }
}