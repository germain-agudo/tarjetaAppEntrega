import 'package:app_tarjeta/global/environments.dart';
import 'package:app_tarjeta/models/redes/Red.dart';
import 'package:app_tarjeta/models/redes/RedListResponse.dart';
import 'package:app_tarjeta/models/redes/RedParticipanteResponse.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:http/http.dart' as http;



class RedesService{

Red red;




Future <List<Red>> cargarRedParticipante(String id)async {

 final uri = Uri.parse('${Environment.apiUrl}/redes-participantes/participantes/$id');

  

    final resp = await http.get(uri,headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});


// print(resp.body);
if (resp.statusCode==200 || resp.statusCode==201) 

{
final redParticipanteResponse = redParticipanteResponseFromJson(resp.body);

final response = redParticipanteResponse.results;

List<Red> redes = [];
response.forEach((element) {
  // print('\n');
  // print(element.redId.id);
  redes.add(element.redId);
  
});

// return redes;

return redes;
} else{
return null;

}
}


}