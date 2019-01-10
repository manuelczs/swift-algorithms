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

func pivot(arr:Array<Int>, lf:Int, rg:Int) -> (Array<Int>,Int) {
	var auxArray:Array<Int> = arr
	var piv:Int = lf
	var i:Int = lf+1
	var j:Int = rg

	while j>=i {
		if auxArray[piv] >= auxArray[i] {
			i+=1
		} else if auxArray[piv] < auxArray[j] {
			j-=1
		} else {
			auxArray = swap(arr:auxArray, a:i, b:j)
			j-=1
			i+=1
		}
	}
	auxArray = swap(arr:auxArray, a:piv, b:j)
	piv = j
	return (auxArray,piv)
}

func quickSortRec(arr:Array<Int>, lf:Int, rg:Int) -> Array<Int> {
	var auxArray2:Array<Int> = arr
	if lf<rg {
		let pairPiv:(Array<Int>,Int) = pivot(arr:auxArray2, lf:lf, rg:rg)
		let piv:Int = pairPiv.1
		let pairArr:Array<Int> = pairPiv.0
		auxArray2 = quickSortRec(arr:pairArr, lf:lf, rg:piv-1)
		auxArray2 = quickSortRec(arr:pairArr, lf:piv+1, rg:rg)
	}
	return auxArray2
}

func quickSort(arr:Array<Int>) -> Array<Int> {
	var auxArray:Array<Int> = arr
	auxArray = quickSortRec(arr:auxArray, lf:0, rg:auxArray.count-1)
	assert(arrayIsSorted(arr:auxArray), "Array is not sorted.")
	return auxArray
}

print(quickSort(arr:[3,0,-1,9,-2,7,-9]))

//print(insertionSort(arr:[1,2,3,4,0,-1]))
//print(selectionSort(arr:[1,2,3,0,-9,-3]))
//print(arrayIsSorted(arr:[0,1,2,3,4,5]))
