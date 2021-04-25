import 'package:im_bored_app/core/network/network_converter.dart';
import 'base_network_model.dart';
import 'network_option_generator.dart';
import 'network_requestor.dart';

class NetworkExecuter{
  Future<K?> execute<T extends BaseNetworkModel, K>(
      T responseType, NetworkOptionsGenerator options) async {

    NetworkRequestor requestor = NetworkRequestor(networkOptions: options);
      var response = await requestor.sendRequest();
      if (response == null) return null;
      NetworkConverter converter = NetworkConverter(response: response);
      var convertedResponse = converter.convertResponse<T,K>(responseType);
      return convertedResponse;
  }
}