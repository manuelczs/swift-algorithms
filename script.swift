func swap(arr:Array<Int>, a:Int, b:Int) -> Array<Int> {
	var arr2:Array<Int> = arr
	let temp_a = arr[a]
	let temp_b = arr[b]

	arr2[a] = temp_b
	arr2[b] = temp_a

	assert(arr2[a] == temp_b && arr2[b] == temp_a)
	return arr2
}

func arrayIsSorted(arr:Array<Int>) -> Bool {
	var result: Bool = true
	var i = 0

	while i<arr.count-1 && result {
		if arr[i] <= arr[i+1] {
			i = i+1
		} else {
			result = false
		}
	}
	return result
}

func minPosFrom(arr:Array<Int>, i:Int) -> Int {
	var minp = i
	var j = i+1

	while j<arr.count {
		if arr[j] <= arr[minp] {
			minp = j
			j += 1
		} else {
			j += 1
		}
	}
	return minp
}

func selectionSort(arr:Array<Int>) -> Array<Int> {
	var auxArray:Array<Int> = arr
	var i = 0
	var minp = 0
	while i<auxArray.count {
		minp = minPosFrom(arr:auxArray, i:i)
		auxArray = swap(arr:auxArray, a:minp, b:i)
		i+=1
	}
	assert(arrayIsSorted(arr:auxArray), "Array is not sorted.")
	return auxArray
}

func insert(arr:Array<Int>, i:Int) -> Array<Int> {
	var auxArray:Array<Int> = arr
	var j = i
	while j>0 && auxArray[j] <= auxArray[j-1] {
		auxArray = swap(arr:auxArray, a:j, b:j-1)
		j -= 1
	}
	return auxArray
}

func insertionSort(arr:Array<Int>) -> Array<Int> {
	var auxArray:Array<Int> = arr
	var i = 1
	while i<auxArray.count {
		auxArray = insert(arr:auxArray, i:i)
		i += 1
	}
	return auxArray
}

print(insertionSort(arr:[1,2,3,4,0,-1]))

//print(selectionSort(arr:[1,2,3,0,-9,-3]))
//print(arrayIsSorted(arr:[0,1,2,3,4,5]))
