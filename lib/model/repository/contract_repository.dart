import '../entity/contract.dart';

abstract class ContractRepository{
  Future<List<Contract>> getContracts(int id);

  Future<List<Contract>> searchContracts(int businessOwnerId);

  Future<Contract> addContract(Contract contract);

  Future<void> editContract(Contract contract);

  Future<void> deleteContract(Contract contract);

}