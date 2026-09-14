class NaiveSort {
  // Selection sort implementation
  // Input: an array of integers
  // Output: the sorted array of integers
  static List<int>? selectionSort(List<int>? arr) {
    if (arr == null || arr.isEmpty || arr.length == 1) {
      return arr;
    }

    for (int i = 0; i < arr.length - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[j] < arr[minIndex]) {
          minIndex = j;
        }
      }
      if (minIndex != i) {
        int temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
    return arr;
  }

  // Bubble sort implementation
  // Input: an array of integers
  // Output: the sorted array of integers
  static List<int>? bubbleSort(List<int>? arr) {
    if (arr == null || arr.isEmpty || arr.length == 1) {
      return arr;
    }

    for (int i = 0; i < arr.length - 1; i++) {
      bool swapped = false;
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
          swapped = true;
        }
      }
      if (!swapped) {
        break;
      }
    }
    return arr;
  }

  // Insertion sort implementation
  // Input: an array of integers
  // Output: the sorted array of integers
  static List<int>? insertionSort(List<int>? arr) {
    if (arr == null || arr.isEmpty || arr.length == 1) {
      return arr;
    }

    for (int i = 1; i < arr.length; i++) {
      int key = arr[i];
      int j = i - 1;
      while (j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j--;
      }
      arr[j + 1] = key;
    }
    return arr;
  }
}