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
let other_student = new_student ()
let setup_teacher t = Test_Teacher.init_teacher t "Michael" Test_Teacher.Male

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

let test_set_grade expected s g = 
  Test_Student.set_grade s g; 
  assert_equal expected (Test_Student.get_total_grade s) 

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

let test_comment_on_grade expected s1 s2 =
  let response = Test_Student.comment_on_grade s1 s2 in
  assert_equal expected !response

let test_finish_course (expected : Test_Student.student) s g c =
  Test_Student.finish_course s g c;
  let same_grade = expected.total_grade = s.total_grade in
  let same_courses = expected.courses = s.courses in
  assert_equal true (same_courses && same_grade)

let test_post_course_dialogue expected t g = 
  let res = Test_Teacher.post_course_dialogue t g 0.5 in 
  assert_equal expected res

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
    ( "set_grade test" >:: fun _ ->
      let student = new_student () in
      test_set_grade 0.9 student 0.9 );
    ( "get_gender test" >:: fun _ ->
      let choice = 1 in
      test_get_student_gender Test_Student.Male choice );
    ( "get_gender test" >:: fun _ ->
      let choice = 2 in
      test_get_student_gender Test_Student.Female choice );
    ( "get_gender test" >:: fun _ ->
      let choice = 3 in
      test_get_student_gender Test_Student.Other choice );
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
      (** Comment on grade tests *)
      (** Whitebox testing *)
      (** Commenton grade branch where s1 grade > s2 grade *) 
      ( "comment on grade branch < s1 and < .1" >:: fun _ ->
        (Test_Student.set_grade other_student 0.5); 
        (Test_Student.set_grade zero_course_student 0.09);
        test_comment_on_grade "Wow you got lower than me, try harder next time buddy!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .2" >:: fun _ ->
        (Test_Student.set_grade other_student 0.5); 
        (Test_Student.set_grade zero_course_student 0.11);
        test_comment_on_grade "Wow you got lower than me, try a little more!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .3" >:: fun _ ->
        (Test_Student.set_grade other_student 0.5); 
        (Test_Student.set_grade zero_course_student 0.21);
        test_comment_on_grade "Wow you got lower than me, almost there!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .4" >:: fun _ ->
        (Test_Student.set_grade other_student 0.5); 
        (Test_Student.set_grade zero_course_student 0.31);
        test_comment_on_grade "Wow you got lower than me, almost passing!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .5" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 0.41);
        test_comment_on_grade "Wow you got lower than me, almost got it!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .6" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 0.51);
        test_comment_on_grade "Wow you got lower than me, at least you passed!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .7" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 0.61);
        test_comment_on_grade "Wow you got lower than me, good stuff!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .8" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 0.71);
        test_comment_on_grade "Wow you got lower than me, nice job!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < .9" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 0.81);
        test_comment_on_grade "Wow you got lower than me, wow you're pretty good at this stuff!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and < 1.0" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 0.91);
        test_comment_on_grade "Wow you got lower than me, you should TA for this class!" zero_course_student other_student 
        );
      ( "comment on grade branch < s1 and > 1.0" >:: fun _ ->
        (Test_Student.set_grade other_student 1.5); 
        (Test_Student.set_grade zero_course_student 1.01);
        test_comment_on_grade "Wow you got lower than me, How did you get such a high score?" zero_course_student other_student 
        );

    (** Tests for when s1 grade < s2 grade *)
    ( "comment on grade branch > s1 and < .1" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.09);
      test_comment_on_grade "Wow you got higher than me, try harder next time buddy!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .2" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.11);
      test_comment_on_grade "Wow you got higher than me, try a little more!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .3" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.21);
      test_comment_on_grade "Wow you got higher than me, almost there!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .4" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.31);
      test_comment_on_grade "Wow you got higher than me, almost passing!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .5" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.41);
      test_comment_on_grade "Wow you got higher than me, almost got it!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .6" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.51);
      test_comment_on_grade "Wow you got higher than me, at least you passed!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .7" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.61);
      test_comment_on_grade "Wow you got higher than me, good stuff!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .8" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.71);
      test_comment_on_grade "Wow you got higher than me, nice job!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < .9" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.81);
      test_comment_on_grade "Wow you got higher than me, wow you're pretty good at this stuff!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and < 1.0" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 0.91);
      test_comment_on_grade "Wow you got higher than me, you should TA for this class!" zero_course_student other_student 
      );
    ( "comment on grade branch > s1 and > 1.0" >:: fun _ ->
      (Test_Student.set_grade other_student 0.01); 
      (Test_Student.set_grade zero_course_student 1.01);
      test_comment_on_grade "Wow you got higher than me, How did you get such a high score?" zero_course_student other_student 
      );
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
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Did you pay attention in class?" teacher 0.01
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: How did you get here" teacher 0.11
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Please retake this class" teacher 0.21
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: I have no words" teacher 0.31
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Please take this course again" teacher 0.41
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: I know you are better than that" teacher 0.51
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Please do better" teacher 0.61
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Almost there" teacher 0.71
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Great job!" teacher 0.81
      );
    ( "post_course_dialogue test" >:: fun _ -> 
      let teacher = new_teacher () in
      (setup_teacher teacher);
      test_post_course_dialogue "Michael: Wow you are doing so well! Have you considered getting a PhD?" teacher 0.91
      );
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
