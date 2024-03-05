void throwError() {
  throw Exception('Error');
}

void main() {
  try {
    throwError();
  } catch (e) {
    print('Exception $e');
  }
}
