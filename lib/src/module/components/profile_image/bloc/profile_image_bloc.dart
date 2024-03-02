import 'package:bloc/bloc.dart';
import 'package:strava_clone/src/boot.dart';
import 'package:equatable/equatable.dart';

part 'profile_image_event.dart';
part 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  ProfileImageBloc() : super(ProfileImageState()) {
    on<FetchedProfileImage>(_onFetchProfileImage);
  }

  final String loadingImage = "https://media.tartoob.com/assets/static/giphy.gif";
  final String failureImage =  "https://media.tartoob.com/assets/static/user.png";

  Future<void> _onFetchProfileImage(
      FetchedProfileImage event, Emitter<ProfileImageState> emit) async {
    try {
      if (state.status == ProfileImageStatus.initial) {
        emit(state.copyWith(
            status: ProfileImageStatus.loading,
            imageUrl: loadingImage));
      }

      if (state.status == ProfileImageStatus.loading) {
        emit(state.copyWith(
            status: ProfileImageStatus.success, 
            imageUrl: event.imageUrl.toString()));
      }

      if (event.imageUrl == '') {
        emit(state.copyWith(
            status: ProfileImageStatus.failure,
            imageUrl: failureImage));
      }

      if (state.status == ProfileImageStatus.failure) {
        emit(state.copyWith(
            status: ProfileImageStatus.initial));
      }
    } catch (ex) {
      emit(state.copyWith(
          status: ProfileImageStatus.failure,
          imageUrl: failureImage));
    }
  }
}
