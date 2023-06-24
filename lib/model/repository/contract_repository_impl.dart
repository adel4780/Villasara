import '../entity/contract.dart';
import '../util/constants.dart';
import 'contract_repository.dart';

class ContractRepositoryImpl extends ContractRepository {

  @override
  Future<List<Contract>> getContracts() async {
    var response = await dio.get('contract/');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Contract> contracts = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var contract = Contract.fromJson(data);
          contracts.add(contract);
        }
      }
      return contracts;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<List<Contract>> searchContracts(int businessOwnerId) async {
    var response = await dio.get('contract/?business_owner=$businessOwnerId');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Contract> contracts = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var contract = Contract.fromJson(data);
          contracts.add(contract);
        }
      }
      return contracts;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Contract> addContract(Contract contract) async {
    var response = await dio.post(
      'contract/',
      data: contract,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newContract = Contract.fromJson(response.data);
    return newContract;
  }

  @override
  Future<void> editContract(Contract contract) async {
    var response = await dio.patch(
      'contract/${contract.id}/',
      data: contract,
    );
    print('response: ${response.statusMessage}');
  }


  @override
  Future<void> deleteContract(Contract contract) async {
    var response = await dio.delete(
      'contract/${contract.id}/',
    );
    print('response: ${response.statusMessage}');
  }

}
