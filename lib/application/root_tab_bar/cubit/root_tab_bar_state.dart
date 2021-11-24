part of 'root_tab_bar_cubit.dart';

@freezed
class RootTabBarState with _$RootTabBarState {
  const factory RootTabBarState.userPage() = _UserPage;
  const factory RootTabBarState.eventsPage() = _EventsPage;
  const factory RootTabBarState.songsLibPage() = _SongsLibPage;
}
