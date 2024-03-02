part of 'profile_image_bloc.dart';

enum ProfileImageStatus { initial, loading, success, failure }

class ProfileImageState extends Equatable {
  ProfileImageStatus? status;
  final String? imageUrl;

  ProfileImageState(
    {this.status = ProfileImageStatus.initial, 
    this.imageUrl = ''
  });

  ProfileImageState copyWith(
    {ProfileImageStatus? status, 
    String? imageUrl
    }) =>
    ProfileImageState(
          imageUrl: imageUrl ?? this.imageUrl, status: status ?? this.status);

  @override
  List<Object> get props => [status!, imageUrl!];
}
