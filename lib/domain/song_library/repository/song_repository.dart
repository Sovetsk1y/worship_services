import 'package:dartz/dartz.dart';
import 'package:worhip_service/domain/song_library/entity/song_list_item.dart';
import 'package:worhip_service/domain/song_library/failure/song_failure.dart';

abstract class SongRepository {
  Future<Either<SongFailure, Iterable<SongListItem>>> getSongLibrary();
}
