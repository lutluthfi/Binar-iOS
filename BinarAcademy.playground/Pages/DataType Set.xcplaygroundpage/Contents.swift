

import Foundation

// Set -> Intersection, Union, symmetricDifference, substracting
let mobileProgramming: Set = ["Swift", "Java", "Kotlin","Dart","Javascript","Python"]
let webProgramming: Set = ["Javascript", "Typescript", "Ruby", "PHP","Dart","Python"]


// Intersection
let intersection = mobileProgramming.intersection(webProgramming)
print(intersection)

// Union
let union = mobileProgramming.union(webProgramming)
print(union)

// symmetricDifference
let uniques = mobileProgramming.symmetricDifference(webProgramming)
print(uniques)

// substracting
let subtracted = mobileProgramming.subtracting(webProgramming)
print(subtracted)
