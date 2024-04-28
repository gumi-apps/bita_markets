// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_api.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$BusinessApiRouter(BusinessApi service) {
  final router = Router();
  router.add(
    'POST',
    r'/',
    service.createShop,
  );
  router.add(
    'GET',
    r'/mine',
    service.getCurrentUserBusiness,
  );
  router.add(
    'PATCH',
    r'/<id>',
    service.updateBiz,
  );
  router.add(
    'POST',
    r'/products',
    service.createProducts,
  );
  router.add(
    'GET',
    r'/products/<bizId>',
    service.getShopProducts,
  );
  router.add(
    'DELETE',
    r'/products/<bizId>/<productId>',
    service.deleteShopProduct,
  );
  router.add(
    'PATCH',
    r'/products/<bizId>/<productId>',
    service.updateBizProduct,
  );
  return router;
}
