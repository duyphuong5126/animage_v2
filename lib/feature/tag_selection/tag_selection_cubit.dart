import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagSelectionCubit extends Cubit<List<String>> {
  TagSelectionCubit() : super([]);

  void updateTags(List<String> tags) {
    emit(tags.sorted());
  }
}
