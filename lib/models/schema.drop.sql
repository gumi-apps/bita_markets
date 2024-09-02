BEGIN;

Alter Table If Exists "businessprefrences"
Drop Constraint If Exists businessprefrences_businessId_unique;

Alter Table If Exists "business"
Drop Constraint If Exists business_addressId_unique;

Alter Table If Exists "unit"
Drop Constraint If Exists unit_name_unique;

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
DROP Constraint If Exists report_business_business_fk;

Alter Table IF Exists "report"
DROP Constraint If Exists report_policy_policy_fk;

Alter Table IF Exists "blocked"
DROP Constraint If Exists blocked_product_product_fk;

Alter Table IF Exists "blocked"
DROP Constraint If Exists blocked_business_business_fk;

Alter Table IF Exists "blocked"
DROP Constraint If Exists blocked_user_user_fk;

Alter Table IF Exists "giftcard"
DROP Constraint If Exists giftcard_business_business_fk;

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
DROP Constraint If Exists order_business_business_fk;

Alter Table IF Exists "follow"
DROP Constraint If Exists follow_user_user_fk;

Alter Table IF Exists "follow"
DROP Constraint If Exists follow_business_business_fk;

Alter Table IF Exists "like"
DROP Constraint If Exists like_product_product_fk;

Alter Table IF Exists "product"
DROP Constraint If Exists product_unit_unit_fk;

Alter Table IF Exists "product"
DROP Constraint If Exists product_catagory_catagory_fk;

Alter Table IF Exists "product"
DROP Constraint If Exists product_brand_brand_fk;

Alter Table IF Exists "product"
DROP Constraint If Exists product_business_business_fk;

Alter Table IF Exists "hasbusinesspermission"
DROP Constraint If Exists hasbusinesspermission_permission_businesspermission_fk;

Alter Table IF Exists "hasbusinesspermission"
DROP Constraint If Exists hasbusinesspermission_business_business_fk;

Alter Table IF Exists "hasbusinesspermission"
DROP Constraint If Exists hasbusinesspermission_employee_businessemploye_fk;

Alter Table IF Exists "businessemploye"
DROP Constraint If Exists businessemploye_business_business_fk;

Alter Table IF Exists "businessemploye"
DROP Constraint If Exists businessemploye_user_user_fk;

Alter Table IF Exists "businessreview"
DROP Constraint If Exists businessreview_business_business_fk;

Alter Table IF Exists "businessreview"
DROP Constraint If Exists businessreview_user_user_fk;

Alter Table IF Exists "businessacitivity"
DROP Constraint If Exists businessacitivity_user_user_fk;

Alter Table IF Exists "businessacitivity"
DROP Constraint If Exists businessacitivity_business_business_fk;

Alter Table IF Exists "businessprefrences"
DROP Constraint If Exists businessprefrences_business_business_fk;

Alter Table IF Exists "business"
DROP Constraint If Exists business_catagory_catagory_fk;

Alter Table IF Exists "business"
DROP Constraint If Exists business_address_address_fk;

Alter Table IF Exists "business"
DROP Constraint If Exists business_owner_user_fk;

Alter Table IF Exists "brand"
DROP Constraint If Exists brand_catagory_catagory_fk;

Alter Table IF Exists "userinterestandinteraction"
DROP Constraint If Exists userinterestandinteraction_user_user_fk;

Alter Table IF Exists "userinterestandinteraction"
DROP Constraint If Exists userinterestandinteraction_catagory_catagory_fk;

Alter Table IF Exists "phonechangerequest"
DROP Constraint If Exists phonechangerequest_user_user_fk;

Alter Table IF Exists "emailchangerequest"
DROP Constraint If Exists emailchangerequest_user_user_fk;

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

Drop Table If Exists "hasbusinesspermission";

Drop Table If Exists "businesspermission";

Drop Table If Exists "businessemploye";

Drop Table If Exists "businessreview";

Drop Table If Exists "businessacitivity";

Drop Table If Exists "businessprefrences";

Drop Table If Exists "business";

Drop Table If Exists "address";

Drop Table If Exists "unit";

Drop Table If Exists "brand";

Drop Table If Exists "catagory";

Drop Table If Exists "userinterestandinteraction";

Drop Table If Exists "phonechangerequest";

Drop Table If Exists "emailchangerequest";

Drop Table If Exists "password";

Drop Table If Exists "user";

Drop Table If Exists "filetb";

COMMIT;