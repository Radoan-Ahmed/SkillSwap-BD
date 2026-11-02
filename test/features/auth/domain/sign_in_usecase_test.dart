import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skill_swap_bd/core/error/result.dart';
import 'package:skill_swap_bd/features/auth/data/model/request/sign_in_request.dart';
import 'package:skill_swap_bd/features/auth/data/model/response/auth_user_response.dart';
import 'package:skill_swap_bd/features/auth/domain/repository/auth_repository.dart';
import 'package:skill_swap_bd/features/auth/domain/usecase/sign_in_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late SignInUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = SignInUsecase(repository);
  });

  const request = SignInRequest(
    email: 'test@example.com',
    password: 'password123',
  );
  const userResponse = AuthUserResponse(
    id: '123',
    email: 'test@example.com',
    fullName: 'Test User',
  );

  test('returns Ok(AuthUserResponse) when repository succeeds', () async {
    when(
      () => repository.signIn(request),
    ).thenAnswer((_) async => const Ok(userResponse));

    final result = await usecase(request);

    expect(result, isA<Ok<AuthUserResponse>>());
    verify(() => repository.signIn(request)).called(1);
  });
}
