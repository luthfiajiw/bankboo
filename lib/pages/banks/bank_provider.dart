import 'package:bankboo/core/providers/base_provider.dart';
import 'package:bankboo/pages/banks/models/banks.dart';

class BankProvider extends BaseProvider {
  Banks _banks = Banks();
  Bank _bank = Bank();

  Banks get banks => _banks;
  Bank get bank => _bank;

  setBanks(Banks value) {
    _banks = value;
    notifyListeners();
  }

  setBank(Bank value) {
    _bank = value;
    notifyListeners();
  }

  updateRelationships(Relationships value) {
    _bank.relationships = value;
    notifyListeners();
  }
}