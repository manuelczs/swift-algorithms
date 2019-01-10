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

func 




//print(arrayIsSorted(arr:[0,1,2,3,4,5]))
