open OUnit2

open Lib
(** Pretty printers *)

(** Test modules *)

module Test_Student = Lib.Student
module Test_Teacher = Lib.Teacher
module Test_Score = Lib.Score

(** Variables *)

let new_student = Test_Student.new_student
let new_teacher = Test_Teacher.new_teacher
let zero_course_student = new_student ()

let setup_teacher =
  Test_Teacher.init_teacher (new_teacher ()) "Michael" Test_Teacher.Male

let one_course_student =
  {
    zero_course_student with
    gender = Test_Student.Male;
    total_grade = 100.0;
    num_courses = 1;
    courses = [ "CS1110" ];
  }

let hypothetical_student =
  {
    one_course_student with
    total_grade = 490.0;
    num_courses = 6;
    courses = [ "CS1110"; "CS2110"; "CS3110"; "CS4110"; "CS5110"; "CS6110" ];
  }

(** Testing Functions *)

let test_set_student_name expected s n =
  Test_Student.set_name s n;
  assert_equal expected s.student_name

let test_set_student_gender expected s g =
  Test_Student.set_gender s g;
  assert_equal expected s.gender

let test_get_student_gender expected in1 =
  let g = Test_Student.get_gender in1 in
  assert_equal expected g

let test_get_student_name expected in1 =
  let n = Test_Student.get_name in1 in
  assert_equal expected n

let test_set_teacher_name expected t n =
  Test_Teacher.set_teacher_name t n;
  assert_equal expected (Test_Teacher.get_teacher_name t)

let test_set_teacher_gender expected t g =
  Test_Teacher.set_teacher_gender t g;
  assert_equal expected (Test_Teacher.get_teacher_gender t)

let test_get_teacher_gender expected in1 =
  let g = Test_Student.get_gender in1 in
  assert_equal expected g

let test_get_teacher_name expected in1 =
  let n = Test_Teacher.get_teacher_name in1 in
  assert_equal expected n

let test_init_student (expected : Test_Student.student) s n g =
  Test_Student.init_student s n g;
  let same_name = s.student_name = expected.student_name in
  let same_gender = s.gender = expected.gender in
  let same = same_gender && same_name in
  assert_equal true same

let test_gender_to_string expected g =
  let g_string = Test_Student.gender_to_string g in
  assert_equal expected g_string

let test_add_course (expected : Test_Student.student) s c =
  Test_Student.add_course s c;
  assert_equal expected.courses s.courses

let test_avg_grade expected s =
  let avg = Test_Student.avg_grade s in
  assert_equal expected avg

let test_add_grade expected s g =
  Test_Student.add_grade s g;
  assert_equal expected s.total_grade

let test_finish_course (expected : Test_Student.student) s g c =
  Test_Student.finish_course s g c;
  let same_grade = expected.total_grade = s.total_grade in
  let same_courses = expected.courses = s.courses in
  assert_equal true (same_courses && same_grade)

let student_tests =
  [
    ( "set_name test" >:: fun _ ->
      let student = new_student () in
      let name = "Michael" in
      test_set_student_name "Michael" student name );
    ( "set_gender test" >:: fun _ ->
      let student = new_student () in
      let new_gender = Test_Student.Male in
      test_set_student_gender new_gender student new_gender );
    ( "get_gender test" >:: fun _ ->
      let choice = 1 in
      test_get_student_gender Test_Student.Male choice );
    ( "init_student test" >:: fun _ ->
      let student_with_info =
        {
          (new_student ()) with
          student_name = "Michael";
          gender = Test_Student.Male;
        }
      in
      test_init_student student_with_info (new_student ()) "Michael"
        Test_Student.Male );
    ( "gender_to_string test" >:: fun _ ->
      let g = Test_Student.Male in
      let result = "Male" in
      test_gender_to_string result g );
    ( "add_course test" >:: fun _ ->
      test_add_course one_course_student (new_student ()) "CS1110" );
    ( "avg_grade test" >:: fun _ ->
      let expected_avg = 490.0 /. float_of_int 6 in
      test_avg_grade expected_avg hypothetical_student );
    ( "add_grade test" >:: fun _ ->
      let expected = 550. in
      let s = { hypothetical_student with total_grade = 470. } in
      test_add_grade expected s 80. );
    ( "finish_course test" >:: fun _ ->
      let s =
        {
          hypothetical_student with
          num_courses = 5;
          total_grade = 400.;
          courses = [ "CS1110"; "CS2110"; "CS3110"; "CS4110"; "CS5110" ];
        }
      in
      test_finish_course hypothetical_student s 90. "CS6110" );
  ]

let teacher_tests =
  [
    ( "set_name test" >:: fun _ ->
      let teacher = new_teacher () in
      let name = "Michael" in
      test_set_teacher_name "Michael" teacher name );
    ( "set_gender test" >:: fun _ ->
      let teacher = new_teacher () in
      let new_gender = Test_Teacher.Male in
      test_set_teacher_gender new_gender teacher new_gender );
  ]

let score_tests =
  [
    ("get score test" >:: fun _ -> assert_equal 0 (Test_Score.get_score ()));
    ( "increment test" >:: fun _ ->
      Test_Score.add_one ();
      assert_equal 1 (Test_Score.get_score ()) );
    ( "increment a score > 1 test" >:: fun _ ->
      Test_Score.add_one ();
      Test_Score.add_one ();
      print_endline (string_of_int (Test_Score.get_score ()));
      assert_equal 2 (Test_Score.get_score ()) );
    ( "reset score test" >:: fun _ ->
      Test_Score.add_one ();
      Test_Score.add_one ();
      Test_Score.reset_score ();
      assert_equal 0 (Test_Score.get_score ()) );
  ]

let suite =
  "Testing suite"
  >::: List.flatten [ student_tests; teacher_tests; score_tests ]

let () = run_test_tt_main suite
