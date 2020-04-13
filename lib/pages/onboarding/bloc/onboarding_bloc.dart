import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stimmungsringeapp/data/onboarding.dart';
import 'package:stimmungsringeapp/pages/onboarding/bloc/bloc.dart';
import 'package:stimmungsringeapp/repositories/repositories.dart';
import 'package:stimmungsringeapp/session.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository onboardingRepository;

  OnboardingBloc({@required this.onboardingRepository})
      : assert(onboardingRepository != null);

  @override
  OnboardingState get initialState => CheckingUserState();

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is CheckUserEvent) {
      yield* _mapCheckUserToState(event);
    } else if (event is ShowCreateNewGroupFormEvent) {
      yield* _mapShowCreateNewGroupFormToState(event);
    } else if (event is CreateNewGroupEvent) {
      yield* _mapCreateNewGroupToState(event);
    } else if (event is ShowJoinGroupFormEvent) {
      yield* _mapShowJoinGroupFormToState(event);
    } else if (event is JoinGroupEvent) {
      yield* _mapJoinGroupToState(event);
    }
  }

  Stream<OnboardingState> _mapCheckUserToState(
      CheckUserEvent checkUser) async* {
    final SigninUserResponse signinUserResponse =
        await onboardingRepository.signin(currentDeviceIdentifier);
    currentUserId = signinUserResponse.userId;

    if (signinUserResponse.hasGroup) {
      currentGroupId = signinUserResponse.groupId;

      yield NoOnboardingRequiredState();
    } else {
      yield OnboardingIntroState();
    }
  }

  Stream<OnboardingState> _mapShowCreateNewGroupFormToState(
      ShowCreateNewGroupFormEvent beginStartNewGroup) async* {
    yield CreateNewGroupFormState();
  }

  Stream<OnboardingState> _mapCreateNewGroupToState(
      CreateNewGroupEvent startNewGroup) async* {
    yield CreateNewGroupPendingState();

    final StartNewGroupResponse startNewGroupResponse =
        await onboardingRepository.startNewGroup(startNewGroup.groupName);

    if (startNewGroupResponse != null) {
      currentGroupId = startNewGroupResponse.groupId;
      yield NewGroupCreatedState(groupName: startNewGroup.groupName);
    } else {
      yield OnboardingIntroState();
    }
  }

  Stream<OnboardingState> _mapShowJoinGroupFormToState(
      ShowJoinGroupFormEvent beginJoinGroup) async* {
    yield JoinGroupFormState();
  }

  Stream<OnboardingState> _mapJoinGroupToState(
      JoinGroupEvent searchGroup) async* {
    yield JoinGroupPendingState();

    final FindGroupResponse findGroupResponse =
        await onboardingRepository.findGroupByCode(searchGroup.groupCode);

    if (findGroupResponse != null) {
      await onboardingRepository.joinGroup(findGroupResponse.groupId);
      currentGroupId = findGroupResponse.groupId;
      yield JoinedGroupState(groupName: findGroupResponse.groupName);
    } else {
      yield GroupNotFoundState();
      yield JoinGroupFormState();
    }
  }

  @override
  void onTransition(Transition<OnboardingEvent, OnboardingState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
