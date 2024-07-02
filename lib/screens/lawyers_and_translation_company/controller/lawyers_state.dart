part of 'lawyers_bloc.dart';

class LawyersState extends Equatable {
  final String token;
  //
  final List<Lawyer> lawyers;
  final RequestState lawyersState;
  final String lawyersMessage;
  //
  final List<Lawyer> translationCompanys;
  final RequestState translationCompanysState;
  final String translationCompanysMessage;
  //
  final List<Lawyer> legalconsultant;
  //
  final List<Lawyer> typingCenters;
  //
  final List<Lawyer> selectedlawyers;
  final bool selecte;
  final FormSubmissionStatus creatgroupstate;
  final String creatgroupMessage;

  const LawyersState({
    this.token = '',
    //
    this.lawyers = const [],
    this.lawyersState = RequestState.loading,
    this.lawyersMessage = '',
    //
    this.translationCompanys = const [],
    this.translationCompanysState = RequestState.loading,
    this.translationCompanysMessage = '',
    //
    this.legalconsultant = const [],
    //
    this.typingCenters = const [],
    //
    this.selectedlawyers = const [],
    //
    this.selecte = false,
    this.creatgroupstate = const InitialFormStatus(),
    this.creatgroupMessage = '',
  });

  LawyersState copyWith({
    String? token,
    //
    List<Lawyer>? lawyers,
    RequestState? lawyersState,
    String? lawyersMessage,
    //
    List<Lawyer>? translationCompanys,
    RequestState? translationCompanysState,
    String? translationCompanysMessage,
    //
    List<Lawyer>? legalconsultant,
    //
    List<Lawyer>? typingCenters,
    //
    List<Lawyer>? selectedlawyers,
    //
    bool? selecte,
    FormSubmissionStatus? creatgroupstate,
    String? creatgroupMessage,
  }) {
    return LawyersState(
      token: token ?? this.token,

      //
      lawyers: lawyers ?? this.lawyers,
      lawyersState: lawyersState ?? this.lawyersState,
      lawyersMessage: lawyersMessage ?? this.lawyersMessage,
      //
      translationCompanys: translationCompanys ?? this.translationCompanys,
      translationCompanysState:
          translationCompanysState ?? this.translationCompanysState,
      translationCompanysMessage:
          translationCompanysMessage ?? this.translationCompanysMessage,
      //
      legalconsultant: legalconsultant ?? this.legalconsultant,
      //
      typingCenters: typingCenters ?? this.typingCenters,
      //
      selectedlawyers: selectedlawyers ?? this.selectedlawyers,
      //
      selecte: selecte ?? this.selecte,
      creatgroupstate: creatgroupstate ?? this.creatgroupstate,
      creatgroupMessage: creatgroupMessage ?? this.creatgroupMessage,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        lawyers,
        lawyersState,
        lawyersMessage,
        //
        translationCompanys,
        translationCompanysState,
        translationCompanysMessage,
        //
        legalconsultant,
        //
        typingCenters,
        //
        selectedlawyers,
        //
        selecte,
        creatgroupstate,
        creatgroupMessage,
      ];
}
