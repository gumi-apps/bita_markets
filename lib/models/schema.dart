import 'package:pg_dorm/pg_dorm.dart';
part 'schema.db.g.dart';
part 'schema.query.g.dart';

class FileTb {
  FileTb({
    required String url,
    this.id,
    bool? isAbsolute,
    double? size,
    bool? hasDependent,
    DateTime? createdAt,
  }) {
    _url = url;
    _isAbsolute = isAbsolute;
    _size = size;
    _hasDependent = hasDependent;
    _createdAt = createdAt;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'filetb',
        columns: _updatedFields,
        operation: Operation('filetbId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return FileTbDb.delete(this);
  }

  late String _url;
  String get url => _url;
  set url(String m) {
    _updatedFields['url'] = m;
    _url = m;
  }

  bool? _isAbsolute;
  bool? get isAbsolute => _isAbsolute;
  set isAbsolute(bool? m) {
    _updatedFields['isAbsolute'] = m;
    _isAbsolute = m;
  }

  double? _size;
  double? get size => _size;
  set size(double? m) {
    _updatedFields['size'] = m;
    _size = m;
  }

  bool? _hasDependent;
  bool? get hasDependent => _hasDependent;
  set hasDependent(bool? m) {
    _updatedFields['hasDependent'] = m;
    _hasDependent = m;
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }
}

class User {
  User({
    this.id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _email = email;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'user',
        columns: _updatedFields,
        operation: Operation('userId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return UserDb.delete(this);
  }

  String? _firstName;
  String? get firstName => _firstName;
  set firstName(String? m) {
    _updatedFields['firstName'] = m;
    _firstName = m;
  }

  String? _lastName;
  String? get lastName => _lastName;
  set lastName(String? m) {
    _updatedFields['lastName'] = m;
    _lastName = m;
  }

  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? m) {
    _updatedFields['phoneNumber'] = m;
    _phoneNumber = m;
  }

  String? _email;
  String? get email => _email;
  set email(String? m) {
    _updatedFields['email'] = m;
    _email = m;
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }

  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? m) {
    _updatedFields['updatedAt'] = m;
    _updatedAt = m;
  }
}

class Password {
  Password({
    required int userId,
    this.id,
    String? password,
    String? emailOtp,
    String? phoneOtp,
    bool? isEmailVerified,
    bool? isPhoneVerified,
  }) {
    _password = password;
    _emailOtp = emailOtp;
    _phoneOtp = phoneOtp;
    _isEmailVerified = isEmailVerified;
    _isPhoneVerified = isPhoneVerified;
    _userId = userId;
  }
  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'password',
        columns: _updatedFields,
        operation: Operation('passwordId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return PasswordDb.delete(this);
  }

  String? _password;
  String? get password => _password;
  set password(String? m) {
    _updatedFields['password'] = m;
    _password = m;
  }

  String? _emailOtp;
  String? get emailOtp => _emailOtp;
  set emailOtp(String? m) {
    _updatedFields['emailOtp'] = m;
    _emailOtp = m;
  }

  String? _phoneOtp;
  String? get phoneOtp => _phoneOtp;
  set phoneOtp(String? m) {
    _updatedFields['phoneOtp'] = m;
    _phoneOtp = m;
  }

  bool? _isEmailVerified;
  bool? get isEmailVerified => _isEmailVerified;
  set isEmailVerified(bool? m) {
    _updatedFields['isEmailVerified'] = m;
    _isEmailVerified = m;
  }

  bool? _isPhoneVerified;
  bool? get isPhoneVerified => _isPhoneVerified;
  set isPhoneVerified(bool? m) {
    _updatedFields['isPhoneVerified'] = m;
    _isPhoneVerified = m;
  }
}

class EmailChangeRequest {
  EmailChangeRequest({
    required String newEmail,
    required String token,
    required int userId,
    this.id,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    _newEmail = newEmail;
    _createdAt = createdAt;
    _token = token;
    _expiresAt = expiresAt;
    _userId = userId;
  }
  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'emailchangerequest',
        columns: _updatedFields,
        operation: Operation('emailchangerequestId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return EmailChangeRequestDb.delete(this);
  }

  late String _newEmail;
  String get newEmail => _newEmail;
  set newEmail(String m) {
    _updatedFields['newEmail'] = m;
    _newEmail = m;
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }

  late String _token;
  String get token => _token;
  set token(String m) {
    _updatedFields['token'] = m;
    _token = m;
  }

  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  set expiresAt(DateTime? m) {
    _updatedFields['expiresAt'] = m;
    _expiresAt = m;
  }
}

class PhoneChangeRequest {
  PhoneChangeRequest({
    required String newPhone,
    required String token,
    required int userId,
    this.id,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    _newPhone = newPhone;
    _token = token;
    _createdAt = createdAt;
    _expiresAt = expiresAt;
    _userId = userId;
  }
  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'phonechangerequest',
        columns: _updatedFields,
        operation: Operation('phonechangerequestId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return PhoneChangeRequestDb.delete(this);
  }

  late String _newPhone;
  String get newPhone => _newPhone;
  set newPhone(String m) {
    _updatedFields['newPhone'] = m;
    _newPhone = m;
  }

  late String _token;
  String get token => _token;
  set token(String m) {
    _updatedFields['token'] = m;
    _token = m;
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }

  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  set expiresAt(DateTime? m) {
    _updatedFields['expiresAt'] = m;
    _expiresAt = m;
  }
}

class UserInterestAndInteraction {
  UserInterestAndInteraction({
    required int catagoryId,
    required int userId,
    this.id,
  }) {
    _catagoryId = catagoryId;
    _userId = userId;
  }
  late int _catagoryId;
  int get catagoryId => _catagoryId;
  set catagoryId(int id) {
    _updatedFields['catagory'] = id;
    _catagoryId = id;
  }

  ModelHolder<Catagory>? _getcatagory;
  Future<Catagory?> get catagory {
    _getcatagory ??= ModelHolder<Catagory>(
      getModelInstance: () =>
          CatagoryDb.get(where: (t) => t.id.equals(catagoryId)),
    );
    return _getcatagory!.instance;
  }

  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'userinterestandinteraction',
        columns: _updatedFields,
        operation:
            Operation('userinterestandinteractionId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return UserInterestAndInteractionDb.delete(this);
  }
}

class Catagory {
  Catagory({
    required String name,
    this.id,
    String? desc,
  }) {
    _name = name;
    _desc = desc;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'catagory',
        columns: _updatedFields,
        operation: Operation('catagoryId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return CatagoryDb.delete(this);
  }

  late String _name;
  String get name => _name;
  set name(String m) {
    _updatedFields['name'] = m;
    _name = m;
  }

  String? _desc;
  String? get desc => _desc;
  set desc(String? m) {
    _updatedFields['desc'] = m;
    _desc = m;
  }
}

class Brand {
  Brand({
    required String name,
    int? catagoryId,
    this.id,
    String? desc,
  }) {
    _name = name;
    _desc = desc;
    _catagoryId = catagoryId;
  }
  int? _catagoryId;
  int? get catagoryId => _catagoryId;
  set catagoryId(int? id) {
    _updatedFields['catagory'] = id;
    _catagoryId = id;
  }

  ModelHolder<Catagory>? _getcatagory;
  Future<Catagory?> get catagory {
    _getcatagory ??= ModelHolder<Catagory>(
      getModelInstance: () =>
          CatagoryDb.get(where: (t) => t.id.equals(catagoryId!)),
    );
    return _getcatagory!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'brand',
        columns: _updatedFields,
        operation: Operation('brandId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BrandDb.delete(this);
  }

  late String _name;
  String get name => _name;
  set name(String m) {
    _updatedFields['name'] = m;
    _name = m;
  }

  String? _desc;
  String? get desc => _desc;
  set desc(String? m) {
    _updatedFields['desc'] = m;
    _desc = m;
  }
}

class Unit {
  Unit({
    required String name,
    this.id,
  }) {
    _name = name;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'unit',
        columns: _updatedFields,
        operation: Operation('unitId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return UnitDb.delete(this);
  }

  late String _name;
  String get name => _name;
  set name(String m) {
    _updatedFields['name'] = m;
    _name = m;
  }
}

class Address {
  Address({
    this.id,
    double? lat,
    double? lng,
    String? plusCode,
    String? sublocality,
    String? locality,
    String? admin1,
    String? admin2,
    String? country,
  }) {
    _lat = lat;
    _lng = lng;
    _plusCode = plusCode;
    _sublocality = sublocality;
    _locality = locality;
    _admin1 = admin1;
    _admin2 = admin2;
    _country = country;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'address',
        columns: _updatedFields,
        operation: Operation('addressId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return AddressDb.delete(this);
  }

  double? _lat;
  double? get lat => _lat;
  set lat(double? m) {
    _updatedFields['lat'] = m;
    _lat = m;
  }

  double? _lng;
  double? get lng => _lng;
  set lng(double? m) {
    _updatedFields['lng'] = m;
    _lng = m;
  }

  String? _plusCode;
  String? get plusCode => _plusCode;
  set plusCode(String? m) {
    _updatedFields['plusCode'] = m;
    _plusCode = m;
  }

  String? _sublocality;
  String? get sublocality => _sublocality;
  set sublocality(String? m) {
    _updatedFields['sublocality'] = m;
    _sublocality = m;
  }

  String? _locality;
  String? get locality => _locality;
  set locality(String? m) {
    _updatedFields['locality'] = m;
    _locality = m;
  }

  String? _admin1;
  String? get admin1 => _admin1;
  set admin1(String? m) {
    _updatedFields['admin1'] = m;
    _admin1 = m;
  }

  String? _admin2;
  String? get admin2 => _admin2;
  set admin2(String? m) {
    _updatedFields['admin2'] = m;
    _admin2 = m;
  }

  String? _country;
  String? get country => _country;
  set country(String? m) {
    _updatedFields['country'] = m;
    _country = m;
  }
}

class Business {
  Business({
    required String name,
    required int ownerId,
    required int addressId,
    int? catagoryId,
    int? logoId,
    this.id,
    String? bgImage,
    DateTime? createdAt,
  }) {
    _name = name;
    _bgImage = bgImage;
    _createdAt = createdAt;
    _ownerId = ownerId;
    _addressId = addressId;
    _catagoryId = catagoryId;
    _logoId = logoId;
  }
  late int _ownerId;
  int get ownerId => _ownerId;
  set ownerId(int id) {
    _updatedFields['owner'] = id;
    _ownerId = id;
  }

  ModelHolder<User>? _getowner;
  Future<User?> get owner {
    _getowner ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(ownerId)),
    );
    return _getowner!.instance;
  }

  late int _addressId;
  int get addressId => _addressId;
  set addressId(int id) {
    _updatedFields['address'] = id;
    _addressId = id;
  }

  ModelHolder<Address>? _getaddress;
  Future<Address?> get address {
    _getaddress ??= ModelHolder<Address>(
      getModelInstance: () =>
          AddressDb.get(where: (t) => t.id.equals(addressId)),
    );
    return _getaddress!.instance;
  }

  int? _catagoryId;
  int? get catagoryId => _catagoryId;
  set catagoryId(int? id) {
    _updatedFields['catagory'] = id;
    _catagoryId = id;
  }

  ModelHolder<Catagory>? _getcatagory;
  Future<Catagory?> get catagory {
    _getcatagory ??= ModelHolder<Catagory>(
      getModelInstance: () =>
          CatagoryDb.get(where: (t) => t.id.equals(catagoryId!)),
    );
    return _getcatagory!.instance;
  }

  int? _logoId;
  int? get logoId => _logoId;
  set logoId(int? id) {
    _updatedFields['logo'] = id;
    _logoId = id;
  }

  ModelHolder<FileTb>? _getlogo;
  Future<FileTb?> get logo {
    _getlogo ??= ModelHolder<FileTb>(
      getModelInstance: () => FileTbDb.get(where: (t) => t.id.equals(logoId!)),
    );
    return _getlogo!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'business',
        columns: _updatedFields,
        operation: Operation('businessId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BusinessDb.delete(this);
  }

  late String _name;
  String get name => _name;
  set name(String m) {
    _updatedFields['name'] = m;
    _name = m;
  }

  String? _bgImage;
  String? get bgImage => _bgImage;
  set bgImage(String? m) {
    _updatedFields['bgImage'] = m;
    _bgImage = m;
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }
}

class BusinessPrefrences {
  BusinessPrefrences({
    required int businessId,
    this.id,
    bool? isAvailableOnline,
    bool? notifyNewProduct,
    bool? receiveOrder,
  }) {
    _isAvailableOnline = isAvailableOnline;
    _notifyNewProduct = notifyNewProduct;
    _receiveOrder = receiveOrder;
    _businessId = businessId;
  }
  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'businessprefrences',
        columns: _updatedFields,
        operation: Operation('businessprefrencesId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BusinessPrefrencesDb.delete(this);
  }

  bool? _isAvailableOnline;
  bool? get isAvailableOnline => _isAvailableOnline;
  set isAvailableOnline(bool? m) {
    _updatedFields['isAvailableOnline'] = m;
    _isAvailableOnline = m;
  }

  bool? _notifyNewProduct;
  bool? get notifyNewProduct => _notifyNewProduct;
  set notifyNewProduct(bool? m) {
    _updatedFields['notifyNewProduct'] = m;
    _notifyNewProduct = m;
  }

  bool? _receiveOrder;
  bool? get receiveOrder => _receiveOrder;
  set receiveOrder(bool? m) {
    _updatedFields['receiveOrder'] = m;
    _receiveOrder = m;
  }
}

class BusinessAcitivity {
  BusinessAcitivity({
    required int businessId,
    int? userId,
    this.id,
    String? action,
  }) {
    _action = action;
    _businessId = businessId;
    _userId = userId;
  }
  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  int? _userId;
  int? get userId => _userId;
  set userId(int? id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId!)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'businessacitivity',
        columns: _updatedFields,
        operation: Operation('businessacitivityId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BusinessAcitivityDb.delete(this);
  }

  String? _action;
  String? get action => _action;
  set action(String? m) {
    _updatedFields['action'] = m;
    _action = m;
  }
}

class BusinessReview {
  BusinessReview({
    required int userId,
    required int businessId,
    this.id,
  }) {
    _userId = userId;
    _businessId = businessId;
  }
  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'businessreview',
        columns: _updatedFields,
        operation: Operation('businessreviewId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BusinessReviewDb.delete(this);
  }
}

class BusinessEmploye {
  BusinessEmploye({
    required int userId,
    required int businessId,
    this.id,
    DateTime? createdAt,
  }) {
    _createdAt = createdAt;
    _userId = userId;
    _businessId = businessId;
  }
  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'businessemploye',
        columns: _updatedFields,
        operation: Operation('businessemployeId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BusinessEmployeDb.delete(this);
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }
}

class BusinessPermission {
  BusinessPermission({
    required String name,
    this.id,
  }) {
    _name = name;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'businesspermission',
        columns: _updatedFields,
        operation: Operation('businesspermissionId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BusinessPermissionDb.delete(this);
  }

  late String _name;
  String get name => _name;
  set name(String m) {
    _updatedFields['name'] = m;
    _name = m;
  }
}

class HasBusinessPermission {
  HasBusinessPermission({
    required int employeeId,
    required int businessId,
    required int permissionId,
    this.id,
    DateTime? createdAt,
  }) {
    _createdAt = createdAt;
    _employeeId = employeeId;
    _businessId = businessId;
    _permissionId = permissionId;
  }
  late int _employeeId;
  int get employeeId => _employeeId;
  set employeeId(int id) {
    _updatedFields['employee'] = id;
    _employeeId = id;
  }

  ModelHolder<BusinessEmploye>? _getemployee;
  Future<BusinessEmploye?> get employee {
    _getemployee ??= ModelHolder<BusinessEmploye>(
      getModelInstance: () =>
          BusinessEmployeDb.get(where: (t) => t.id.equals(employeeId)),
    );
    return _getemployee!.instance;
  }

  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  late int _permissionId;
  int get permissionId => _permissionId;
  set permissionId(int id) {
    _updatedFields['permission'] = id;
    _permissionId = id;
  }

  ModelHolder<BusinessPermission>? _getpermission;
  Future<BusinessPermission?> get permission {
    _getpermission ??= ModelHolder<BusinessPermission>(
      getModelInstance: () =>
          BusinessPermissionDb.get(where: (t) => t.id.equals(permissionId)),
    );
    return _getpermission!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'hasbusinesspermission',
        columns: _updatedFields,
        operation: Operation('hasbusinesspermissionId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return HasBusinessPermissionDb.delete(this);
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }
}

class Product {
  Product({
    required String name,
    required String productUId,
    required double costPrice,
    required double sellingPrice,
    required double quantity,
    required int businessId,
    int? brandId,
    int? catagoryId,
    int? unitId,
    this.id,
    DateTime? expireDate,
    DateTime? manDate,
    String? desc,
  }) {
    _name = name;
    _productUId = productUId;
    _costPrice = costPrice;
    _sellingPrice = sellingPrice;
    _quantity = quantity;
    _expireDate = expireDate;
    _manDate = manDate;
    _desc = desc;
    _businessId = businessId;
    _brandId = brandId;
    _catagoryId = catagoryId;
    _unitId = unitId;
  }
  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  int? _brandId;
  int? get brandId => _brandId;
  set brandId(int? id) {
    _updatedFields['brand'] = id;
    _brandId = id;
  }

  ModelHolder<Brand>? _getbrand;
  Future<Brand?> get brand {
    _getbrand ??= ModelHolder<Brand>(
      getModelInstance: () => BrandDb.get(where: (t) => t.id.equals(brandId!)),
    );
    return _getbrand!.instance;
  }

  int? _catagoryId;
  int? get catagoryId => _catagoryId;
  set catagoryId(int? id) {
    _updatedFields['catagory'] = id;
    _catagoryId = id;
  }

  ModelHolder<Catagory>? _getcatagory;
  Future<Catagory?> get catagory {
    _getcatagory ??= ModelHolder<Catagory>(
      getModelInstance: () =>
          CatagoryDb.get(where: (t) => t.id.equals(catagoryId!)),
    );
    return _getcatagory!.instance;
  }

  int? _unitId;
  int? get unitId => _unitId;
  set unitId(int? id) {
    _updatedFields['unit'] = id;
    _unitId = id;
  }

  ModelHolder<Unit>? _getunit;
  Future<Unit?> get unit {
    _getunit ??= ModelHolder<Unit>(
      getModelInstance: () => UnitDb.get(where: (t) => t.id.equals(unitId!)),
    );
    return _getunit!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'product',
        columns: _updatedFields,
        operation: Operation('productId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return ProductDb.delete(this);
  }

  late String _name;
  String get name => _name;
  set name(String m) {
    _updatedFields['name'] = m;
    _name = m;
  }

  late String _productUId;
  String get productUId => _productUId;
  set productUId(String m) {
    _updatedFields['productUId'] = m;
    _productUId = m;
  }

  late double _costPrice;
  double get costPrice => _costPrice;
  set costPrice(double m) {
    _updatedFields['costPrice'] = m;
    _costPrice = m;
  }

  late double _sellingPrice;
  double get sellingPrice => _sellingPrice;
  set sellingPrice(double m) {
    _updatedFields['sellingPrice'] = m;
    _sellingPrice = m;
  }

  late double _quantity;
  double get quantity => _quantity;
  set quantity(double m) {
    _updatedFields['quantity'] = m;
    _quantity = m;
  }

  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? m) {
    _updatedFields['expireDate'] = m;
    _expireDate = m;
  }

  DateTime? _manDate;
  DateTime? get manDate => _manDate;
  set manDate(DateTime? m) {
    _updatedFields['manDate'] = m;
    _manDate = m;
  }

  String? _desc;
  String? get desc => _desc;
  set desc(String? m) {
    _updatedFields['desc'] = m;
    _desc = m;
  }
}

class Like {
  Like({
    required int productId,
    this.id,
  }) {
    _productId = productId;
  }
  late int _productId;
  int get productId => _productId;
  set productId(int id) {
    _updatedFields['product'] = id;
    _productId = id;
  }

  ModelHolder<Product>? _getproduct;
  Future<Product?> get product {
    _getproduct ??= ModelHolder<Product>(
      getModelInstance: () =>
          ProductDb.get(where: (t) => t.id.equals(productId)),
    );
    return _getproduct!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'like',
        columns: _updatedFields,
        operation: Operation('likeId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return LikeDb.delete(this);
  }
}

class Follow {
  Follow({
    required int businessId,
    required int userId,
    this.id,
  }) {
    _businessId = businessId;
    _userId = userId;
  }
  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'follow',
        columns: _updatedFields,
        operation: Operation('followId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return FollowDb.delete(this);
  }
}

class Order {
  Order({
    required int businessId,
    required int userId,
    this.id,
    String? status,
    String? type,
    String? msg,
  }) {
    _status = status;
    _type = type;
    _msg = msg;
    _businessId = businessId;
    _userId = userId;
  }
  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'order',
        columns: _updatedFields,
        operation: Operation('orderId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return OrderDb.delete(this);
  }

  String? _status;
  String? get status => _status;
  set status(String? m) {
    _updatedFields['status'] = m;
    _status = m;
  }

  String? _type;
  String? get type => _type;
  set type(String? m) {
    _updatedFields['type'] = m;
    _type = m;
  }

  String? _msg;
  String? get msg => _msg;
  set msg(String? m) {
    _updatedFields['msg'] = m;
    _msg = m;
  }
}

class Items {
  Items({
    required int quantity,
    required int productId,
    int? orderId,
    this.id,
    DateTime? createdAt,
  }) {
    _quantity = quantity;
    _createdAt = createdAt;
    _productId = productId;
    _orderId = orderId;
  }
  late int _productId;
  int get productId => _productId;
  set productId(int id) {
    _updatedFields['product'] = id;
    _productId = id;
  }

  ModelHolder<Product>? _getproduct;
  Future<Product?> get product {
    _getproduct ??= ModelHolder<Product>(
      getModelInstance: () =>
          ProductDb.get(where: (t) => t.id.equals(productId)),
    );
    return _getproduct!.instance;
  }

  int? _orderId;
  int? get orderId => _orderId;
  set orderId(int? id) {
    _updatedFields['order'] = id;
    _orderId = id;
  }

  ModelHolder<Order>? _getorder;
  Future<Order?> get order {
    _getorder ??= ModelHolder<Order>(
      getModelInstance: () => OrderDb.get(where: (t) => t.id.equals(orderId!)),
    );
    return _getorder!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'items',
        columns: _updatedFields,
        operation: Operation('itemsId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return ItemsDb.delete(this);
  }

  late int _quantity;
  int get quantity => _quantity;
  set quantity(int m) {
    _updatedFields['quantity'] = m;
    _quantity = m;
  }

  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }
}

class Notification {
  Notification({
    required DateTime timestamp,
    required String title,
    required String content,
    required String type,
    required int userId,
    this.id,
  }) {
    _timestamp = timestamp;
    _title = title;
    _content = content;
    _type = type;
    _userId = userId;
  }
  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'notification',
        columns: _updatedFields,
        operation: Operation('notificationId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return NotificationDb.delete(this);
  }

  late DateTime _timestamp;
  DateTime get timestamp => _timestamp;
  set timestamp(DateTime m) {
    _updatedFields['timestamp'] = m;
    _timestamp = m;
  }

  late String _title;
  String get title => _title;
  set title(String m) {
    _updatedFields['title'] = m;
    _title = m;
  }

  late String _content;
  String get content => _content;
  set content(String m) {
    _updatedFields['content'] = m;
    _content = m;
  }

  late String _type;
  String get type => _type;
  set type(String m) {
    _updatedFields['type'] = m;
    _type = m;
  }
}

class GiftCard {
  GiftCard({
    required String couponId,
    required int ownerId,
    int? createdById,
    int? productId,
    int? businessId,
    this.id,
    bool? redeemed,
    DateTime? expireDate,
  }) {
    _couponId = couponId;
    _redeemed = redeemed;
    _expireDate = expireDate;
    _ownerId = ownerId;
    _createdById = createdById;
    _productId = productId;
    _businessId = businessId;
  }
  late int _ownerId;
  int get ownerId => _ownerId;
  set ownerId(int id) {
    _updatedFields['owner'] = id;
    _ownerId = id;
  }

  ModelHolder<User>? _getowner;
  Future<User?> get owner {
    _getowner ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(ownerId)),
    );
    return _getowner!.instance;
  }

  int? _createdById;
  int? get createdById => _createdById;
  set createdById(int? id) {
    _updatedFields['createdBy'] = id;
    _createdById = id;
  }

  ModelHolder<User>? _getcreatedBy;
  Future<User?> get createdBy {
    _getcreatedBy ??= ModelHolder<User>(
      getModelInstance: () =>
          UserDb.get(where: (t) => t.id.equals(createdById!)),
    );
    return _getcreatedBy!.instance;
  }

  int? _productId;
  int? get productId => _productId;
  set productId(int? id) {
    _updatedFields['product'] = id;
    _productId = id;
  }

  ModelHolder<Product>? _getproduct;
  Future<Product?> get product {
    _getproduct ??= ModelHolder<Product>(
      getModelInstance: () =>
          ProductDb.get(where: (t) => t.id.equals(productId!)),
    );
    return _getproduct!.instance;
  }

  int? _businessId;
  int? get businessId => _businessId;
  set businessId(int? id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId!)),
    );
    return _getbusiness!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'giftcard',
        columns: _updatedFields,
        operation: Operation('giftcardId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return GiftCardDb.delete(this);
  }

  late String _couponId;
  String get couponId => _couponId;
  set couponId(String m) {
    _updatedFields['couponId'] = m;
    _couponId = m;
  }

  bool? _redeemed;
  bool? get redeemed => _redeemed;
  set redeemed(bool? m) {
    _updatedFields['redeemed'] = m;
    _redeemed = m;
  }

  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? m) {
    _updatedFields['expireDate'] = m;
    _expireDate = m;
  }
}

class Blocked {
  Blocked({
    int? userId,
    int? businessId,
    int? productId,
    this.id,
    DateTime? endDate,
  }) {
    _endDate = endDate;
    _userId = userId;
    _businessId = businessId;
    _productId = productId;
  }
  int? _userId;
  int? get userId => _userId;
  set userId(int? id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId!)),
    );
    return _getuser!.instance;
  }

  int? _businessId;
  int? get businessId => _businessId;
  set businessId(int? id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId!)),
    );
    return _getbusiness!.instance;
  }

  int? _productId;
  int? get productId => _productId;
  set productId(int? id) {
    _updatedFields['product'] = id;
    _productId = id;
  }

  ModelHolder<Product>? _getproduct;
  Future<Product?> get product {
    _getproduct ??= ModelHolder<Product>(
      getModelInstance: () =>
          ProductDb.get(where: (t) => t.id.equals(productId!)),
    );
    return _getproduct!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'blocked',
        columns: _updatedFields,
        operation: Operation('blockedId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return BlockedDb.delete(this);
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? m) {
    _updatedFields['endDate'] = m;
    _endDate = m;
  }
}

class Policy {
  Policy({
    required DateTime createdAt,
    this.id,
    int? number,
    String? detail,
  }) {
    _number = number;
    _detail = detail;
    _createdAt = createdAt;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'policy',
        columns: _updatedFields,
        operation: Operation('policyId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return PolicyDb.delete(this);
  }

  int? _number;
  int? get number => _number;
  set number(int? m) {
    _updatedFields['number'] = m;
    _number = m;
  }

  String? _detail;
  String? get detail => _detail;
  set detail(String? m) {
    _updatedFields['detail'] = m;
    _detail = m;
  }

  late DateTime _createdAt;
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime m) {
    _updatedFields['createdAt'] = m;
    _createdAt = m;
  }
}

class Report {
  Report({
    required int businessId,
    required int userId,
    int? policyId,
    int? violatorId,
    int? productId,
    this.id,
    String? desc,
  }) {
    _desc = desc;
    _policyId = policyId;
    _businessId = businessId;
    _userId = userId;
    _violatorId = violatorId;
    _productId = productId;
  }
  int? _policyId;
  int? get policyId => _policyId;
  set policyId(int? id) {
    _updatedFields['policy'] = id;
    _policyId = id;
  }

  ModelHolder<Policy>? _getpolicy;
  Future<Policy?> get policy {
    _getpolicy ??= ModelHolder<Policy>(
      getModelInstance: () =>
          PolicyDb.get(where: (t) => t.id.equals(policyId!)),
    );
    return _getpolicy!.instance;
  }

  late int _businessId;
  int get businessId => _businessId;
  set businessId(int id) {
    _updatedFields['business'] = id;
    _businessId = id;
  }

  ModelHolder<Business>? _getbusiness;
  Future<Business?> get business {
    _getbusiness ??= ModelHolder<Business>(
      getModelInstance: () =>
          BusinessDb.get(where: (t) => t.id.equals(businessId)),
    );
    return _getbusiness!.instance;
  }

  late int _userId;
  int get userId => _userId;
  set userId(int id) {
    _updatedFields['user'] = id;
    _userId = id;
  }

  ModelHolder<User>? _getuser;
  Future<User?> get user {
    _getuser ??= ModelHolder<User>(
      getModelInstance: () => UserDb.get(where: (t) => t.id.equals(userId)),
    );
    return _getuser!.instance;
  }

  int? _violatorId;
  int? get violatorId => _violatorId;
  set violatorId(int? id) {
    _updatedFields['violator'] = id;
    _violatorId = id;
  }

  ModelHolder<User>? _getviolator;
  Future<User?> get violator {
    _getviolator ??= ModelHolder<User>(
      getModelInstance: () =>
          UserDb.get(where: (t) => t.id.equals(violatorId!)),
    );
    return _getviolator!.instance;
  }

  int? _productId;
  int? get productId => _productId;
  set productId(int? id) {
    _updatedFields['product'] = id;
    _productId = id;
  }

  ModelHolder<Product>? _getproduct;
  Future<Product?> get product {
    _getproduct ??= ModelHolder<Product>(
      getModelInstance: () =>
          ProductDb.get(where: (t) => t.id.equals(productId!)),
    );
    return _getproduct!.instance;
  }

  final _updatedFields = <String, dynamic>{};
  int? id;
  Future<void> save() async {
    if (_updatedFields.isNotEmpty) {
      final query = Query.update(
        table: 'report',
        columns: _updatedFields,
        operation: Operation('reportId'.safeTk, Operator.eq, id),
      );
      await Database.execute(query.toString());
    }
  }

  Future<bool> delete() async {
    return ReportDb.delete(this);
  }

  String? _desc;
  String? get desc => _desc;
  set desc(String? m) {
    _updatedFields['desc'] = m;
    _desc = m;
  }
}
