import 'package:strava_clone/src/boot.dart';
import 'package:strava_clone/src/module/components/profile_image/bloc/profile_image_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';


class UserProfileImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const UserProfileImage({Key? key, required this.imagePath, this.size = 40,}) : super(key: key);

  Widget customCircularAvatar(state) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: state.imageUrl.toString(),
            fit: BoxFit.cover,
            height: 140,
            width: 140,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ProfileImageBloc()..add(FetchedProfileImage(imageUrl: imagePath)),
        child: BlocBuilder<ProfileImageBloc, ProfileImageState>(
          builder: (context, state) {
            switch (state.status) {
              case ProfileImageStatus.loading:
                return customCircularAvatar(state);
              case ProfileImageStatus.initial:
                return customCircularAvatar(state);
              case ProfileImageStatus.failure:
                return customCircularAvatar(state);
              case ProfileImageStatus.success:
                return customCircularAvatar(state);
              default:
                return Container();
            }
          },
        ));
  }
}
