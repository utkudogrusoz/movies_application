import 'dart:convert';

import 'package:http/http.dart' as http; 



class BaseServices<T> { 



 Future baseService(String url) async {
    var response = await http.get(url);
    if (response.statusCode==200){
      return json.decode(response.body);

    
    } 

    else{print("kategori servis hatası".toUpperCase());}
   
  }
} 


