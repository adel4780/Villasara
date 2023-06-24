import '../entity/tenant.dart';

abstract class TenantRepository{
  Future<List<Tenant>> getTenants();

  Future<List<Tenant>> searchTenants(int id);

  Future<List<Tenant>> searchPhone(String Phone);

  Future<Tenant> addTenant(Tenant tenant);

  Future<void> editTenant(Tenant tenant);

  Future<void> deleteTenant(Tenant tenant);
}