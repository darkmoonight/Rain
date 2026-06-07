import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/repositories/cities_repository.dart';

void main() {
  late TestIsarContext ctx;
  late CitiesRepository repository;

  setUp(() async {
    ctx = await openTestIsar();
    final remote = createFakeWeatherRemoteDatasource();
    repository = CitiesRepository(ctx.isar, remote);
  });

  tearDown(() async {});

  group('CitiesRepository', () {
    test('addCard assigns sequential index', () async {
      final card = completeWeatherCard(index: null);
      await repository.addCard(card);

      final cards = await repository.getAllSorted();
      expect(cards, hasLength(1));
      expect(cards.first.index, 0);
    });

    test('getExpiredSorted returns stale cards only', () async {
      await repository.addCard(
        completeWeatherCard(timestamp: DateTime(2026, 6, 4)),
      );
      await repository.addCard(
        completeWeatherCard(id: 2, timestamp: DateTime(2026, 6, 6), index: 1),
      );

      final expired = await repository.getExpiredSorted(DateTime(2026, 6, 5));
      expect(expired, hasLength(1));
    });

    test('fetchCard returns card from remote datasource', () async {
      final card = await repository.fetchCard(
        55.75,
        37.62,
        'Moscow',
        'Moscow Oblast',
        'Europe/Moscow',
      );

      expect(card.city, 'Moscow');
      expect(card.temperature2M, isNotEmpty);
    });

    test('deleteCard removes card from storage', () async {
      final card = completeWeatherCard();
      await repository.addCard(card);
      final stored = (await repository.getAllSorted()).first;

      await repository.deleteCard(stored);

      expect(await repository.getAllSorted(), isEmpty);
    });

    test('repairIndices fixes gaps on read', () async {
      await seedWeatherCard(ctx.isar, completeWeatherCard(index: 0));
      await seedWeatherCard(ctx.isar, completeWeatherCard(id: 2, index: 3));

      final cards = await repository.getAllSorted();
      expect(cards.map((c) => c.index).toList(), [0, 1]);
    });

    test('reorder moves card and reindexes', () async {
      await repository.addCard(completeWeatherCard(id: 1, index: 0));
      await repository.addCard(
        completeWeatherCard(id: 2, index: 1)
          ..city = 'Berlin'
          ..district = 'Berlin',
      );

      await repository.reorder(0, 2);

      final cards = await repository.getAllSorted();
      expect(cards.first.city, 'Berlin');
      expect(cards.map((c) => c.index).toList(), [0, 1]);
    });

    test('updateCard persists field changes', () async {
      final card = completeWeatherCard();
      await repository.addCard(card);
      final stored = (await repository.getAllSorted()).first;
      stored.city = 'Berlin';

      await repository.updateCard(stored);

      final updated = (await repository.getAllSorted()).first;
      expect(updated.city, 'Berlin');
    });

    test(
      'applyRemoteUpdate copies forecast fields onto existing card',
      () async {
        final card = completeWeatherCard();
        await repository.addCard(card);
        final stored = (await repository.getAllSorted()).first;
        final remote = await repository.fetchCard(
          55.75,
          37.62,
          'Moscow',
          'Moscow Oblast',
          'Europe/Moscow',
        );

        await repository.applyRemoteUpdate(stored, remote);

        final updated = (await repository.getAllSorted()).first;
        expect(updated.temperature2M, remote.temperature2M);
        expect(updated.id, stored.id);
      },
    );
  });
}
