part of 'addnotescubit.dart';

@immutable
abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailur extends AddNotesState
{
  final String errMessage;

  AddNotesFailur({required this.errMessage});
  
}