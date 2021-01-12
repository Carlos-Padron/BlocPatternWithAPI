import 'package:BlocPatternWithAPI/models/Book.dart';
import 'package:BlocPatternWithAPI/services/dataService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final DataService dataService;
  var bookCollection = List<Book>();

  CollectionCubit({this.dataService})
      : super(CollectionFetching()); //CollectionFetching()

  Future<void> getBooks() async {
    try {
      print('en  future');
      emit(CollectionFetching());
      bookCollection = await dataService.getBooks();
      emit(CollectionFetched(bookCollection));
    } catch (e) {
      emit(CollectionError(e.toString()));
    }
  }

  void selectBooks(int index) {
    bookCollection[index].isSelected = !bookCollection[index].isSelected;
    emit(CollectionFetched(bookCollection));
  }

  int selectedBooks() {
    List<Book> selectedBooks = bookCollection;
    selectedBooks =
        selectedBooks.where((book) => book.isSelected == true).toList();
    return selectedBooks.length;
  }
}
