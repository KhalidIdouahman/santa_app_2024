import 'package:ironsource_mediation/ironsource_mediation.dart';

class IronSourceOfferWallPusher with IronSourceOfferwallListener{
  @override
  void onGetOfferwallCreditsFailed(IronSourceError error) {
    // TODO: implement onGetOfferwallCreditsFailed
  }

  @override
  void onOfferwallAdCredited(IronSourceOfferWallCreditInfo creditInfo) {
    // TODO: implement onOfferwallAdCredited
  }

  @override
  void onOfferwallAvailabilityChanged(bool isAvailable) {
    // TODO: implement onOfferwallAvailabilityChanged
  }

  @override
  void onOfferwallClosed() {
    // TODO: implement onOfferwallClosed
  }

  @override
  void onOfferwallOpened() {
    // TODO: implement onOfferwallOpened
  }

  @override
  void onOfferwallShowFailed(IronSourceError error) {
    // TODO: implement onOfferwallShowFailed
  }

}