(* All questions can have at most 26 choices. *)

(* To create a new set of questions, follow example below: *)
let cs1110 : Question.t list =
  [
    (* CS 1110 *)
    Question.make "How is a comment written in Python?" 1
      [ "Using //"; "Using #"; "Using /* */"; "Using <!-- -->" ];
    Question.make "What does the 'break' keyword do in Python?" 0
      [
        "Exits the current loop";
        "Breaks the program";
        "Pauses the loop";
        "Skips the next iteration";
      ];
    Question.make "In python, what is used to concatenate str?" 0
      [ "+"; "-"; "*"; "/" ];
    Question.make "In Python, which data type is mutable?" 2
      [ "Tuple"; "String"; "List"; "Integer" ];
    Question.make
      "What is the time complexity of combing through an array of size n?" 0
      [ "O(n)"; "O(logn)"; "O(1)"; "O(0)" ];
    Question.make "What is Professor White's first name?" 3
      [ "Michael"; "Walter"; "Luke"; "Walker" ];
    Question.make
      "What method in Python is used to remove the last element from a list?" 0
      [ "pop()"; "remove()"; "del()"; "discard()" ];
  ]

let cs2110 : Question.t list =
  [
    (* CS 2110 *)
    Question.make "Dijkstra’s algorithm is used for:" 2
      [
        "Sorting";
        "Searching";
        "Finding the shortest path in a graph";
        "Balancing a binary tree";
      ];
    Question.make "A balanced binary tree has a height of:" 0
      [ "O(log n)"; "O(n)"; "O(n^2)"; "O(1)" ];
    Question.make "In hash tables, collisions can be resolved by:" 3
      [
        "Changing the hash function";
        "Removing elements";
        "Rehashing periodically";
        "Chaining";
      ];
    Question.make "Worst-case time complexity of linear search is:" 2
      [ "O(log n)"; "O(n log n)"; "O(n)"; "O(1)" ];
    Question.make "A complete binary tree can be represented as:" 1
      [ "Linked list"; "Array"; "Stack"; "Queue" ];
  ]

let cs3110 : Question.t list =
  [
    (* CS 3110 *)
    Question.make "Which is less used in functional programming?" 3
      [
        "Recursion";
        "Immutable data";
        "Higher-order functions";
        "State mutation";
      ];
    Question.make "A lambda expression is:" 2
      [
        "A data type";
        "A control structure";
        "An anonymous function";
        "A recursive function";
      ];
    Question.make "The concept of currying is named after who?" 0
      [ "Haskell Curry"; "Steph Curry"; "Spicy Curry"; "Thai Curry" ];
    Question.make "In modules, 'namespacing' is used to:" 1
      [
        "Optimize code performance";
        "Prevent name conflicts";
        "Implement recursion";
        "Handle exceptions";
      ];
    Question.make "Functors are primarily used for:" 0
      [
        "Modular code reuse";
        "Data manipulation";
        "Looping constructs";
        "Asynchronous operations";
      ];
    Question.make "What is a monad? (Choose the best answer)" 3
      [ "A house"; "An abstract representation of a box"; "A dog"; "A burrito" ];
  ]

let cs2800 : Question.t list =
  [
    (* CS 2800 *)
    Question.make "# of edges in a complete graph with n vertices:" 3
      [ "n"; "n^2"; "n/2"; "(n*(n-1))/2" ];
    Question.make "The power set of a set S includes:" 2
      [
        "All subsets of S and S itself";
        "Only the proper subsets of S";
        "All subsets of S including the empty set";
        "All elements larger than S";
      ];
    Question.make "p → q is false only when:" 3
      [
        "p is true and q is true";
        "p is false and q is true";
        "p and q are both false";
        "p is true and q is false";
      ];
    Question.make "The sum of degrees of all vertices in a graph =:" 3
      [
        "Number of vertices";
        "Number of edges";
        "Twice the number of vertices";
        "Twice the number of edges";
      ];
    Question.make "A set is countably infinite if:" 1
      [
        "It is unbounded";
        "It can be put into a one-to-one correspondence with naturals";
        "It has a finite number of elements";
        "It is a subset of real numbers";
      ];
  ]

let phys1112 : Question.t list =
  [
    (* PHYS 1112 *)
    Question.make "Which below is NOT a vector quantity?" 1
      [ "Force"; "Speed"; "Momentum"; "Displacement" ];
    Question.make "What is the unit for work?" 3
      [ "(kg*m)/s"; "(kg^2*m)/s^2"; "(kg*m)/s^2"; "(kg*m^2)/s^2" ];
    Question.make "How else can be 1 Newton be expressed?" 2
      [ "(kg*m)/s"; "(kg^2*m)/s^2"; "(kg*m)/s^2"; "(kg*m^2)/s^2" ];
    Question.make "In a inelastic collision, what is NOT conserved?" 0
      [ "Kinetic Energy"; "Total Energy"; "Momentum"; "Angular Momentum" ];
    Question.make "How does halving d between two masses affect F_g?" 2
      [
        "F_g is halved";
        "F_g is doubled";
        "F_g increases 4x";
        "F_g  decreases 4x";
      ];
  ]

let phys2213 : Question.t list =
  [
    (* PHYS 2213 *)
    Question.make "Which is the E&M analog to speed in mechanics?" 2
      [ "Electric Field"; "Magnetic Flux"; "Current"; "Voltage" ];
    Question.make "How is electric flux defined?" 1
      [
        "E*A*sin(theta)";
        "E*A*cos(theta)";
        "E^2*A*cos(theta)";
        "E*A^2*cos(theta)";
      ];
    Question.make "In EM waves, frequency directly affects?" 3
      [ "Amplitude"; "Speed"; "Wavelength"; "Energy" ];
    Question.make "Faraday's Law relates to?" 1
      [
        "Magnetic fields and current";
        "Changing magnetic fields and voltage";
        "Currents and repulsion";
        "Conductor resistance";
      ];
    Question.make "What is not true about magnetic fields?" 0
      [
        "Act on stationary charges";
        "Have poles";
        "Propagate in vacuum";
        "Induce current";
      ];
  ]

let math1920 : Question.t list =
  [
    (* MATH 1920 *)
    Question.make "\"Maximum rate of increase\" is related to:" 3
      [ "Divergence"; "Curl"; "Cross product"; "Gradient" ];
    Question.make "Line integral of gradient field equals:" 1
      [ "Curl"; "Endpoint difference"; "Divergence"; "Cross product" ];
    Question.make "Taking the curl of the grad of a scalar field gives:" 0
      [
        "The 0 vector field";
        "The 0 scalar field";
        "the original scalar field";
        "the original scalar field scaled";
      ];
    Question.make "Taking the div. of the curl of a vector field gives:" 1
      [
        "The 0 vector field";
        "The 0 scalar field";
        "the original vector field";
        "the original vector field scaled";
      ];
    Question.make "The Laplacian of a scalar field is computed as:" 2
      [
        "Grad of the curl";
        "Curl of the curl";
        "Div of the grad";
        "Grad of the div";
      ];
  ]

let math2940 : Question.t list =
  [
    (* MATH 2940 *)
    Question.make "In a vector space, a basis is:" 2
      [
        "Always constant";
        "Dependent on the matrix";
        "A set of linearly independent vectors";
        "Related to the determinant";
      ];
    Question.make "A matrix is orthogonal if its columns are:" 3
      [ "Linearly dependent"; "Non-zero"; "Equal in length"; "Orthonormal" ];
    Question.make "Eigenvalues of a matrix are found from:" 1
      [
        "Matrix addition";
        "Characteristic polynomial";
        "Matrix multiplication";
        "Determinant";
      ];
    Question.make "A symmetric matrix is equal to its:" 1
      [ "Inverse"; "Transpose"; "Determinant"; "Eigenmatrix" ];
    Question.make "The trace of a matrix is the sum of its:" 0
      [ "Diagonal elements"; "Eigenvalues"; "Row elements"; "Column elements" ];
  ]

let go_next q_manager =
  match QuestionManager.pop q_manager with
  | None -> ()
  | Some _ -> ()

let got_question_correct q_manager =
  Score.add_one ();
  go_next q_manager

let got_question_wrong q_manager = go_next q_manager
