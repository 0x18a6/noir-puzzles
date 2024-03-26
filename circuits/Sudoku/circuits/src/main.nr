use dep::std;

// Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

//     "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
//                                                                                    [0, 0, 1, 0]
//                                                                                    [0, 0, 0, 3]
//                                                                                    [2, 0, 0, 0]

//     "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
//                                                                                    [3, 2, 1, 4]
//                                                                                    [4, 1, 2, 3]
//                                                                                    [2, 3, 4, 1]

fn main(question: pub [Field; 16], answer : [Field; 16]) {
       
    // Verifying the Question
    for i in 0..16 {
        let mut a = question[i] == answer[i];
        let mut b = question[i] == 0;
        let c = a | b;
        std::println(c);
        assert(c == true);
    }

// Check first row has 3 inputs as 0 and 1 input as non zero
    let mut m:[Field; 16] = [0; 16];
    for i in 0..4 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[0] + m[1] +m[2] + m[3]));

// Check second row has 3 inputs as 0 and 1 input as non zero

    for i in 4..8 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[4] + m[5] +m[6] + m[7]));

// Check third row has 3 inputs as 0 and 1 input as non zero

    for i in 8..12 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[8] + m[9] +m[10] + m[11]));

// Check fourth row has 3 inputs as 0 and 1 input as non zero

    for i in 12..16 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[12] + m[13] +m[14] + m[15]));    

    // Solution Starts Here ..
        assert(10 == answer[0] + answer[1] + answer[2] + answer[3]);
    assert(10 == answer[4] + answer[5] + answer[6] + answer[7]);
    assert(10 == answer[8] + answer[9] + answer[10] + answer[11]);
    assert(10 == answer[12] + answer[13] + answer[14] + answer[15]);

    for row in 0..4 {
        let mut arr: [Field; 4]  = [0; 4];
        for i in 0..4 {
            arr[answer[row * 4 + i] - 1] += 1;
        }

        for i in 0..4 {
            assert(arr[i] == 1);
        }
    }

    assert(10 == answer[0] + answer[4] + answer[8] + answer[12]);
    assert(10 == answer[1] + answer[5] + answer[9] + answer[13]);
    assert(10 == answer[2] + answer[6] + answer[10] + answer[14]);
    assert(10 == answer[3] + answer[7] + answer[11] + answer[15]);

    for col in 0..4 {
        let mut arr: [Field; 4]  = [0; 4];
        for i in 0..4 {
            arr[answer[i * 4 + col] - 1] += 1;
        }

        for i in 0..4 {
            assert(arr[i] == 1);
        }
    }
}
