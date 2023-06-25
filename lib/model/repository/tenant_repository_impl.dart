import '../entity/tenant.dart';
import '../util/constants.dart';
import 'tenant_repository.dart';


class TenantRepositoryImpl extends TenantRepository {

  @override
  Future<List<Tenant>> getTenants() async {
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Tenant> tenants = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var tenant = Tenant.fromJson(data);
          tenants.add(tenant);
        }
      }
      return tenants;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Tenant>> searchTenants(int id)  async {
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Tenant> tenants = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var tenant = Tenant.fromJson(data);
          if(id == tenant.id) {
            tenants.add(tenant);
          }
        }
      }
      return tenants;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Tenant>> searchPhone(String Phone) async{
    var response = await dio.get('Tenant/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Tenant> tenants = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var tenant = Tenant.fromJson(data);
          if(tenant.phone_number == Phone) {
            tenants.add(tenant);
          }
        }
      }
      return tenants;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<Tenant> addTenant(Tenant tenant) async {
    var response = await dio.post(
      'Tenant/',
      data: tenant,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newTenant = Tenant.fromJson(response.data);
    return newTenant;
  }
  @override
  Future<void> editTenant(Tenant tenant) async {
    var response = await dio.patch(
      'Tenant/${tenant.id}/',
      data: tenant,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteTenant(Tenant tenant) async {
    var response = await dio.delete(
      'Tenant/${tenant.id}/',
    );
    print('response: ${response.statusMessage}');
  }

}