//Create Post
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/models/api_response.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/services/user_service.dart';
import '../constant.dart';

Future<ApiResponse> createPost(String body, String? image) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    String token = await getToken();
  } catch(e){
    apiResponse.error = serverError;
  }

  return apiResponse;
}

//edit post
Future<ApiResponse> editPost(int postId, String body) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    String token = await getToken();
  } catch(e){
    apiResponse.error = serverError;
  }

  return apiResponse;
}