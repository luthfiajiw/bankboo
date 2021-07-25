import 'package:bankboo/pages/banks/bank_provider.dart';
import 'package:bankboo/pages/banks/models/banks.dart';
import 'package:bankboo/pages/banks/banks_repository.dart';

class BanksService extends BankProvider {
  BanksRepository banksRepository = BanksRepository();

  Future<Banks> getBanks() async {
    setBusy(true);

    try {
      Banks banks = await banksRepository.getBanks();

      setBanks(banks);

      return banks;
    } catch (e) {
      throw(e);
    } finally {
      setBusy(false);
    }
  }
}