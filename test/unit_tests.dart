import 'package:anywhere_coding_exercise/flavors.dart';
import 'package:anywhere_coding_exercise/helpers.dart';
import 'package:test/test.dart';

void main() {
  test('getApiUrl', () {
    String apiUrl = getApiUrl();
    if (F.appFlavor == Flavor.simpsons) {
      expect(apiUrl, "simpsons+characters&format=json");
    } else if (F.appFlavor == Flavor.wire) {
      expect(apiUrl, "the+wire+characters&format=json");
    } else {
      expect(apiUrl, "simpsons+characters&format=json");
    }
  });
}
