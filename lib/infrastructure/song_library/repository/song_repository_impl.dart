import 'package:injectable/injectable.dart';
import 'package:worhip_service/domain/song_library/failure/song_failure.dart';
import 'package:worhip_service/domain/song_library/entity/song_list_item.dart';
import 'package:dartz/dartz.dart';
import 'package:worhip_service/domain/song_library/repository/song_repository.dart';

@LazySingleton(as: SongRepository)
class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either<SongFailure, Iterable<SongListItem>>> getSongLibrary() async {
    return right(Iterable.generate(
        10,
        (index) => SongListItem(
            id: index.toString(), title: 'Песня нумер ${index + 1}')));
  }
}
