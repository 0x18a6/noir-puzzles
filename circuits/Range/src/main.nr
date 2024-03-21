// Check the range of a private variable and prove that it is within the range.
// There are three inputs "a", "lowerbound" and "upperbound". If 'a' is within
// the range of the two other inputs, output 1, else output 0.

fn main(a : i64, lowerbound : pub i64, upperbound : pub i64) -> pub u64 {

  // one-liner. [FIXME] may overflow
  if (lowerbound - a) * (a - upperbound) < 0 {0} else {1} 
}

////////////////////
//     TESTS      //
////////////////////
#[test]
// Do not modify this function
fn test_range() {
  assert(main(1, 2, 5) == 0);
  assert(main(10, 1, 20) == 1);
}
