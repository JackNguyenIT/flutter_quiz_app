import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/data/question/question.dart';
import 'package:quiz_app/data/repository/question/question_repository.dart';

part 'question_cubit.freezed.dart';
part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionRepository _questionRepository;
  late final Stream<List<Question>> questionAsStream;

  QuestionCubit({required QuestionRepository questionRepository})
      : _questionRepository = questionRepository,
        super(const QuestionState.initial()) {
    questionAsStream = _questionRepository.getQuestionAsStreams();
  }
}
