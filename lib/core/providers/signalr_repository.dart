import 'package:signalr_netcore/signalr_client.dart';
import 'package:upwork_client/constant.dart';

class SignalRRepository {
  factory SignalRRepository() {
    return _repository;
  }

  SignalRRepository._internal(){
    hubConnection.onreconnected(({connectionId}) {
      print('Logs: onreconnected');
    });
    hubConnection.onclose(({error}) {
      print('Logs: onclose, ${error}');
    });
    hubConnection.onreconnecting(({error}) {
      print('Logs: onclose');
    });
   hubConnection.start();
  }

  static final SignalRRepository _repository = SignalRRepository._internal();

  final hubConnection = HubConnectionBuilder()
      .withUrl('${Constant.domain}mobile')
      .withAutomaticReconnect()
      .build();

  void addOn(MethodInvocationFunc newMethod){
    hubConnection.on('jobs', newMethod);
  }
}
