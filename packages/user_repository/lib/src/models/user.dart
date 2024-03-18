import '../entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String encryptedPassword;
  String name;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.email,
    required this.encryptedPassword,
    required this.name,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
    userId: '',
    email: '',
    encryptedPassword: '',
    name: '',
    hasActiveCart: false,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      encryptedPassword: encryptedPassword,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      encryptedPassword: entity.encryptedPassword,
      name: entity.name,
      hasActiveCart: entity.hasActiveCart,
    );
  }

  @override
  String toString() {
    return 'MyUser: {userId: $userId, email: $email, encryptedPassword: $encryptedPassword, name: $name, hasActiveCart: $hasActiveCart}';
  }
}
