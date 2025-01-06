import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 1) 
class ProfileModel extends HiveObject {
  @HiveField(0)
  String image;

  @HiveField(1)
  String username;

  @HiveField(2)
  String email;

  @HiveField(3)
  String date;

  ProfileModel(this.image, this.username, this.email, this.date);
}