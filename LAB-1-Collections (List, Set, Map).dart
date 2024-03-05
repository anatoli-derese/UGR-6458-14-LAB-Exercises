void main(){
  List<int> nums = [1,2,3,4,5];
  int maxVal = maximum(nums);
  print(maxVal);

  print(">>>>>>>");

  Map<int,int> testMap = {1:1, 2:2, 3:3, 4:4};
  printMap(testMap);
  print(">>>>>>>");
  

  List<int> firstList = [1, 2, 3, 4, 2, 3, 5, 6, 1];
  List<int>  doneList= removeDuplicates(firstList);
  print(firstList);
  print(doneList);
  }
int maximum (List<int> nums){
  int temp = nums[0];
  
  for (int num in nums){
    if (num > temp){
      temp = num;
    }
  }
  return temp;
}

void printMap (Map<int, int> map){
  map.forEach((key, value) {
    print('$key: $value');
  });
}


List<int> removeDuplicates<int>(List<int> list) {
  List<int> result = [];
  for (int val in list) {
    if (! result.contains(val)) {
      result.add(val);
    }
  }
  return result;
}


  
  