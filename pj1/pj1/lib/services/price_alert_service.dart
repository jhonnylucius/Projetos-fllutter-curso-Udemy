import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PriceAlertService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _notifications.initialize(initializationSettings);
  }

  Future<void> showPriceAlert(
    String itemName,
    String locationName,
    double variation,
  ) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'price_alerts',
        'Alertas de Preço',
        channelDescription:
            'Notificações sobre variações significativas de preço',
        importance: Importance.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.show(
      0,
      'Alteração Significativa de Preço',
      '$itemName ${variation > 0 ? "aumentou" : "diminuiu"} '
          '${variation.abs().toStringAsFixed(1)}% em $locationName',
      notificationDetails,
    );
  }
}
