ArrayJoin(array, spliter := ",") {
  result := ""
  is_first := true
  for element in array {
    if is_first {
      is_first := false
    } else {
      result .= spliter
    }
    result .= element
  }
  return result
}

ArrayIncludes(array, target_element) {
  for element in array {
    if element == target_element {
      return true
    }
  }
  return false
}

ArrayConcat(first_array, second_array) {
  result := first_array.clone()
  for element in second_array {
    result.push(element)
  }
  return result
}