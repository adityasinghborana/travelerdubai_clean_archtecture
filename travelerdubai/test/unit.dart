import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travelerdubai/homepage/remote/response/model/homepagedata.dart';
import 'package:travelerdubai/homepage/usecase/usecase.dart';
import 'package:travelerdubai/homepage/repository/homepage_repository.dart';




// Mock class for HomePageRepository
class MockHomePageRepository extends Mock implements HomeRepository {}

void main() {
  group('GetHomePageDataUseCase', () {
    // Initialize dependencies
    final mockRepository = MockHomePageRepository();
    final useCase = GetHomePageDatUseCase(mockRepository);

    test('execute - Success', () async {
      // Arrange
      final expectedData =  HomepageData(
        id: 1,
        counter1: 20,
        counter2: 30,
        counter3: 40,
        counter4: 50,
        detail: "gsdsfshssmssjsjsbj",
        detail1: "sfjshshshs",
        detail2: "sfsfsgssjsnksnkss.ms.",
        heading1: "hsghshshgshgsjsgjsgjsjs",
        heading2: "shsjhsgjsgjksksskslls",
        heading3: "bmsbsksksbsjvsjs",
        heading4: "svjssgsbsbs",
        label1: "google",
        label2: "www.google.com",
        label3: "www.google.com",
        label4: "www.google.com",
        subheading1: "www.google.com",
        subheading2: "www.google.com",
        subtitle: "www.google.com",
        title: "www.google.com",
      );
      when(mockRepository.getdata()).thenAnswer((_) async => expectedData);

      // Act
      final result = await useCase.execute();

      // Assert
      expect(result, equals(expectedData));
    });

    test('execute - Failure', () async {
      // Arrange
      final exception = Exception('Failed to fetch data');
      when(mockRepository.getdata()).thenThrow(exception);

      // Act
      Future<HomepageData> result() async {
        return await useCase.execute();
      }

      // Assert
      expect(result, throwsA(exception));
    });
  });
}