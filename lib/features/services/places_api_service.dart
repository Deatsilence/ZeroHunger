import 'package:zero_hunger/features/constant/api_key/api_keys.dart';
import 'package:zero_hunger/features/constant/base_url/base_urls.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';
import 'package:http/http.dart' as http;

mixin PlacesApiServiceManager {
  AdvertViewModel get _avm => AdvertViewModel();

  Future<http.Response> getSuggestion(String input) async {
    var request =
        "${BaseUrls().placesOfBaseUrl}?input=$input&key=${ApiKeys().placesApiKey}&sessiontoken=${_avm.sessionToken}";
    var response = await http.get(Uri.parse(request));

    return response;
  }
}
