BEGIN;

Alter Table If Exists "shopprefrences"
Drop Constraint If Exists shopprefrences_shopId_unique;

Alter Table If Exists "shop"
Drop Constraint If Exists shop_addressId_unique;

Alter Table If Exists "brand"
Drop Constraint If Exists brand_name_unique;

Alter Table If Exists "catagory"
Drop Constraint If Exists catagory_name_unique;

Alter Table If Exists "user"
Drop Constraint If Exists user_email_unique;

Alter Table If Exists "user"
Drop Constraint If Exists user_phoneNumber_unique;

Alter Table IF Exists "report"
DROP Constraint If Exists report_product_product_fk;

Alter Table IF Exists "report"
DROP Constraint If Exists report_violator_user_fk;

Alter Table IF Exists "report"
DROP Constraint If Exists report_user_user_fk;

Alter Table IF Exists "report"
DROP Constraint If Exists report_shop_shop_fk;

Alter Table IF Exists "report"
DROP Constraint If Exists report_policy_policy_fk;

Alter Table IF Exists "blocked"
DROP Constraint If Exists blocked_product_product_fk;

Alter Table IF Exists "blocked"
DROP Constraint If Exists blocked_shop_shop_fk;

Alter Table IF Exists "blocked"
DROP Constraint If Exists blocked_user_user_fk;

Alter Table IF Exists "giftcard"
DROP Constraint If Exists giftcard_shop_shop_fk;

Alter Table IF Exists "giftcard"
DROP Constraint If Exists giftcard_product_product_fk;

Alter Table IF Exists "giftcard"
DROP Constraint If Exists giftcard_createdBy_user_fk;

Alter Table IF Exists "giftcard"
DROP Constraint If Exists giftcard_owner_user_fk;

Alter Table IF Exists "notification"
DROP Constraint If Exists notification_user_user_fk;

Alter Table IF Exists "items"
DROP Constraint If Exists items_order_order_fk;

Alter Table IF Exists "items"
DROP Constraint If Exists items_product_product_fk;

Alter Table IF Exists "order"
DROP Constraint If Exists order_user_user_fk;

Alter Table IF Exists "order"
DROP Constraint If Exists order_shop_shop_fk;

Alter Table IF Exists "follow"
DROP Constraint If Exists follow_user_user_fk;

Alter Table IF Exists "follow"
DROP Constraint If Exists follow_shop_shop_fk;

Alter Table IF Exists "like"
DROP Constraint If Exists like_product_product_fk;

Alter Table IF Exists "shopreview"
DROP Constraint If Exists shopreview_shop_shop_fk;

Alter Table IF Exists "shopreview"
DROP Constraint If Exists shopreview_user_user_fk;

Alter Table IF Exists "shopacitiviy"
DROP Constraint If Exists shopacitiviy_user_user_fk;

Alter Table IF Exists "shopprefrences"
DROP Constraint If Exists shopprefrences_shop_shop_fk;

Alter Table IF Exists "shop"
DROP Constraint If Exists shop_catagory_catagory_fk;

Alter Table IF Exists "shop"
DROP Constraint If Exists shop_address_address_fk;

Alter Table IF Exists "shop"
DROP Constraint If Exists shop_owner_user_fk;

Alter Table IF Exists "brand"
DROP Constraint If Exists brand_catagory_catagory_fk;

Alter Table IF Exists "userinterestandinteraction"
DROP Constraint If Exists userinterestandinteraction_user_user_fk;

Alter Table IF Exists "userinterestandinteraction"
DROP Constraint If Exists userinterestandinteraction_catagory_catagory_fk;

Alter Table IF Exists "infochangerequest"
DROP Constraint If Exists infochangerequest_user_user_fk;

Alter Table IF Exists "password"
DROP Constraint If Exists password_user_user_fk;

Drop Table If Exists "report";

Drop Table If Exists "policy";

Drop Table If Exists "blocked";

Drop Table If Exists "giftcard";

Drop Table If Exists "notification";

Drop Table If Exists "items";

Drop Table If Exists "order";

Drop Table If Exists "follow";

Drop Table If Exists "like";

Drop Table If Exists "product";

Drop Table If Exists "shopreview";

Drop Table If Exists "shopacitiviy";

Drop Table If Exists "shopprefrences";

Drop Table If Exists "shop";

Drop Table If Exists "address";

Drop Table If Exists "brand";

Drop Table If Exists "catagory";

Drop Table If Exists "userinterestandinteraction";

Drop Table If Exists "infochangerequest";

Drop Table If Exists "password";

Drop Table If Exists "user";

Drop Table If Exists "filetb";

COMMIT;