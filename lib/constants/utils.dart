const Token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZmZiM2FhMTlmZmJiYjI2NGFiMzEzZTQ1N2M5NTI2YiIsIm5iZiI6MTcyNzk3MDQzNy44MTIxLCJzdWIiOiI2NmZlYmI5MmU4NGVlYjM1YTBmN2RmODYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aUttZ4heK4dnUpCxl4Z8LAb_6PUTFDWHVMPC-Vna7F8";
const baseUrl = "https://api.themoviedb.org";
const ApiKey = "cffb3aa19ffbbb264ab313e457c9526b";
const imageBaseUrl = "https://media.themoviedb.org/t/p/w220_and_h330_face/";

int getYear(String dateString){
  DateTime dateTime = DateTime.parse(dateString);
  int year = dateTime.year;
  return year;
}
String convertToDdMmYyyy(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = '${dateTime.day.toString().padLeft(2, '0')}/'
      '${dateTime.month.toString().padLeft(2, '0')}/'
      '${dateTime.year}';
  
  return formattedDate; 
}