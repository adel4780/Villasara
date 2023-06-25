import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/entity/contract.dart';
import '../model/repository/contract_repository_impl.dart';

class ContractViewModel extends ChangeNotifier {
  var repository = ContractRepositoryImpl();

  StreamController<List<Contract>> villas =
  StreamController<List<Contract>>();

  Future<void> getContracts(int id) async {
    villas.add(await repository.getContracts(id));
    notifyListeners();
  }

  Future<void> searchContracts(int id) async {
    villas.add(await repository.searchContracts(id));
    notifyListeners();
  }
  Future<Contract> addContract(Contract contract) async {
    var newContract = await repository.addContract(contract);
    notifyListeners();
    return newContract;
  }
  Future<void> editContract(Contract contract) async {
    await repository.editContract(contract);
    notifyListeners();
  }
  Future<void> deleteContract(Contract contract) async {
    await repository.deleteContract(contract);
    notifyListeners();
  }
}