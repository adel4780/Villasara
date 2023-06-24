import 'dart:async';
import '../model/entity/tenant.dart';
import '../model/repository/tenant_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class TenantViewModel extends ChangeNotifier {
  var repository = TenantRepositoryImpl();

  StreamController<List<Tenant>> tenants =
  StreamController<List<Tenant>>();

  void getTenants() async {
    tenants.add(await repository.getTenants());
    notifyListeners();
  }
  void searchTenants(int id) async {
    tenants.add(await repository.searchTenants(id));
    notifyListeners();
  }
  void searchPhone(String Phone) async {
    tenants.add(await repository.searchPhone(Phone));
    notifyListeners();
  }
  Future<Tenant> addTenant(Tenant tenant) async {
    var newTenant = await repository.addTenant(tenant);
    notifyListeners();
    return newTenant;
  }
  Future<void> editTenant(Tenant tenant) async {
    repository.editTenant(tenant);
    notifyListeners();
  }
  void deleteTenant(Tenant tenant) async {
    repository.deleteTenant(tenant);
    notifyListeners();
  }
}