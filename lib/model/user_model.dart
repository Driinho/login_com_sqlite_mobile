class UserModel {
  String userId;
  String userName;
  String userEmail;
  String userPassword;
  String? userImage;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    this.userImage,
  });

  @override
  String toString() {
    return 'UserModel(userId: $userId, userName: $userName, userEmail: $userEmail, userPassword: $userPassword, userImage: $userImage)';
  }
}
