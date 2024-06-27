import 'dart:convert';

import 'package:http/http.dart' as http;

class MedicalHistoryService {
  Future<List<Map<String, dynamic>>> getMedicalHistory() async {
    try {
      Uri url = Uri.parse(
        'http://127.0.0.1:8000/api/medical-history',
      );
      Map<String, String> header = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YTE1YWQ4YS0xNTAyLTQ5MDktYTViZS0wNDRmYjIxNTVjMzAiLCJqdGkiOiIyNmY3ZmYxZGM2ZGYzOTFjMDU4YjYxYzcxZTM2NTNmN2ZlMDc0NjAwNDgwM2M5MTQ4MDAxZTJiY2JmNDU2OTliZGNhNmFkZTc5OTI5N2NmZiIsImlhdCI6MTY5NTk4MzA0My45MDE1NjEsIm5iZiI6MTY5NTk4MzA0My45MDE1NjMsImV4cCI6MTcyNzYwNTQ0My44OTA4MzEsInN1YiI6IjY4ODkxMGY5LWUxZDgtNGY4Ny05OWZiLWRlMzQ1NTJmZWUyZCIsInNjb3BlcyI6W119.e_oEoYHdKnK9RtFs4RBmYChsio4FHU4S9rtpkvIHuNLcCqO9JhURxOJiKlQ84BgJ1xvDDLc-Aosk34KUfZYsiMWlihVAEoNIXC7NaupY3Enjim-OZawaHOkQ3NxFXv_2BZKN3LHQQnyi3GIK5emn3Z4PNtt7cTgei5xrnHjl3_1WmCMTXHhmWl6gjPNBfwkO5c-PDl-48zGsC5QjCKEKQwKTMtaJyKm1msB6DxUDqGB7enpAG_ZScVWYMwueWcvJzDaabtBkqa3xpE_yT8H-IPF6y940SCHV3NRYpiavCoV30Jkq3MYuc8DNR_EzAC1x3tUjRxVhb1wApCqmcqVk2YjSby_YLUdFPLbJ82JVY-dYGqZrhklXhFxlpngkcqA3pfWZmORBMsLiO7utftmgi6TWmrTUHnEIrtIAEu9V5riryaDMron9GXp9BpNNpl65ddNryd_iyoqz6A1iR-2sA_PQyhOodrr4bvbpHH7_Xe07CuRT945PU5niT-OPGPVjuDpqA8DSXBciJan6rDpuqtYgjHZPuJu4KsV7eTiiYaVnqaGMzIHx59hcWZqgtviOQElm8TYhGwqliMGazEeEunoUUOB_R9o79r3vf7bke9Jpf86Xa5DgJSZUTpTYDDb5gmFsSRJ_vjgErpJn-D4FKWeEwIDZH3PN7r3NNxsXG28',
      };
      http.Response response = await http.get(
        url,
        headers: header,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body)['data'];
        // Convert the dynamic list to the desired type List<Map<String, dynamic>>
        final List<Map<String, dynamic>> medicalHistoryList =
            responseData.map((item) {
          return Map<String, dynamic>.from(item);
        }).toList();
        return medicalHistoryList;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
