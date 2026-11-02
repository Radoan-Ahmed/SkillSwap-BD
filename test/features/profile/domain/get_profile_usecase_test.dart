import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/profile/data/model/response/profile_response.dart';
import 'package:skill_swap_bd/features/profile/domain/repository/profile_repository.dart';
import 'package:skill_swap_bd/features/profile/domain/usecase/get_profile_usecase.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late MockProfileRepository repository;
  late GetProfileUsecase usecase;

  setUp(() {
    repository = MockProfileRepository();
    usecase = GetProfileUsecase(repository);
  });

  const profile = ProfileResponse(
    id: 'user_1',
    email: 'test@example.com',
    fullName: 'Radoan Ahmed',
    skillsOffered: ['Flutter', 'Dart'],
    skillsLearned: ['Python'],
  );

  test('returns Ok(ProfileResponse) when repository succeeds', () async {
    when(
      () => repository.getProfile('user_1'),
    ).thenAnswer((_) async => const Ok(profile));

    final result = await usecase('user_1');

    expect(result, isA<Ok<ProfileResponse>>());
    verify(() => repository.getProfile('user_1')).called(1);
  });
}
