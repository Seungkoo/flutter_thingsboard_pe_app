import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

mixin CustomersBase on EntitiesBase<Customer, PageLink> {
  @override
  String get title => '고객 목록';

  @override
  String get noItemsFoundText => '등록된 고객이 없습니다.';

  @override
  Future<PageData<Customer>> fetchEntities(PageLink pageLink) {
    return tbClient.getCustomerService().getCustomers(pageLink);
  }

  @override
  void onEntityTap(Customer customer) {
    navigateTo('/customer/${customer.id!.id}');
  }
}
