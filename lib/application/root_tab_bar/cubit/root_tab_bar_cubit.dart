import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_tab_bar_state.dart';
part 'root_tab_bar_cubit.freezed.dart';

class RootTabBarCubit extends Cubit<RootTabBarState> {
  RootTabBarCubit() : super(RootTabBarState.eventsPage());
}
