import 'package:cosmetics_app/views/pages/profile/model.dart';

class ProfileStates{}

class ProfileInitialStates extends ProfileStates{}
class ProfileLoadingStates extends ProfileStates{}
class ProfileSuccessStates extends ProfileStates{
  final ProfileDataModel list;
  ProfileSuccessStates({required this.list});
}
class ProfileFailedStates extends ProfileStates{}