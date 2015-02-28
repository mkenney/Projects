#!/usr/bin/env python

"""
https://github.com/mkenney/Projects
Implement two types of sorting algorithms: Merge sort and bubble sort.
- This is the merge sort version
"""

def mergeSort(arr):
	"""
	Split out the array parts and pass them to merge for sorting
	"""
	if len(arr) <= 1:
		ret_val = arr

	else:
		mid = len(arr) / 2
		left_arr = arr[:mid]
		right_arr = arr[mid:]

		left_arr = mergeSort(left_arr)
		right_arr = mergeSort(right_arr)

		ret_val = list(merge(left_arr, right_arr))

	return ret_val

def merge(left, right):
	"""
	Sort and merge array pieces
	"""
	ret_val = []
	l_index = 0
	r_index = 0

	while l_index < len(left) and r_index < len(right):

		if left[l_index] <= right[r_index]:
			ret_val.append(left[l_index])
			l_index += 1

		else:
			ret_val.append(right[r_index])
			r_index += 1

	# catch the rest
	if len(left) > l_index:
		for a in range(l_index, len(left)):
			ret_val.append(left[a])

	if len(right) > r_index:
		for a in range(r_index, len(right)):
			ret_val.append(right[a])

	return ret_val



# yeah, you can't add 'q' or 's' to the sort list.  It'll take a more bored
# version of me to bother with that
val = ''
vals = []
while 'q' != val:
	val = raw_input("\nEnter a value add it to the list of values ('s' to sort current values, 'q' to quit): ")
	if 'q' != val:

		if 's' == val:
			vals = mergeSort(vals)
			print "sorted vals: '"+"', '".join(vals)+"'\n"
			vals = []

		else:
			vals.append(val)
