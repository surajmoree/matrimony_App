part of 'profile_image_bloc.dart';

abstract class ProfileImageEvent extends Equatable {
  const ProfileImageEvent();

  @override
  List<Object> get props => [];
}

class FetchedProfileImage extends ProfileImageEvent {
  final String? imageUrl;
  const FetchedProfileImage({this.imageUrl});
}
