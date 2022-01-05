var s1 = "How are you ?\n";
var s2 = "I'm Fine!";
// var s3 = s1 + s2;
var s3 = '$s1 - $s2';
int x = 10;
int y = x *2;
// What about array
List<int> numbers = [1,2,4,5,6,7];

//Map
List<String> stringNumbers = numbers.map((e){
  return 'value = $e';
}).toList();