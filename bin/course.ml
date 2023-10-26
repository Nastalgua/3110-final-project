(* The module Course defines a class that a student take, containing questions
   and answers *)
module Course = struct
  type answer = {
    content : string;
    is_correct : bool;
  }
  (** Each answer choice consists of the answer string and whether it is correct *)

  type question = {
    prompt : string;
    choices : answer list;
  }
  (** A question has content and a list of possible answer choices *)

  type t = {
    subject : string;
    number : int;
    professor : string;
    questions : question list; (* This should be question list, not 'a list *)
  }

  (** Creates a course with an empty test bank *)
  let create_empty_course (sub : string) (num : int) (prof : string) : t =
    { subject = sub; number = num; professor = prof; questions = [] }

  (** Creates a new question *)
  let create_question (prmpt : string) (ans_choices : answer list) : question =
    { prompt = prmpt; choices = ans_choices }

  (** Adds a question to a course's test bank *)
  let add_question (course : t) (ques : question) : t =
    { course with questions = ques :: course.questions }

  (** Returns the concatenated subject and number of the course *)
  let course_name (course : t) : string =
    course.subject ^ string_of_int course.number
end

(* Course 1: CS 1110 *)
module CS1110 = struct
  open Course

  let course = create_empty_course "CS" 1110 "Walter White"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 2: CS 2110 *)
module CS2110 = struct
  open Course

  let course = create_empty_course "CS" 2110 "Terminology Overlord"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 3: CS 2800 *)
module CS2800 = struct
  open Course

  let course = create_empty_course "CS" 2800 ""

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 4: CS 3110 *)
module CS3110 = struct
  open Course

  let course = create_empty_course "CS" 3110 "Dexter Kozen"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 5: CS 3410 *)
module CS3410 = struct
  open Course

  let course = create_empty_course "CS" 3410 "Anne Bracy"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 6: CS 4820 *)
module CS4820 = struct
  open Course

  let course = create_empty_course "CS" 4820 "Bobby Kleinberg"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 7: CS 6820 *)
module CS6820 = struct
  open Course

  let course = create_empty_course "CS" 6820 "Bobby Kleinberg"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 8: CS 6802 *)
module CS6802 = struct
  open Course

  let course = create_empty_course "CS" 6802 "Noah Something"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 9: Math 1920 *)
module MATH1920 = struct
  open Course

  let course = create_empty_course "MATH" 1920 "Kelly Delp"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end

(* Course 10: Math 2940 *)
module MATH2940 = struct
  open Course

  let course = create_empty_course "MATH" 2940 "Alex Townsend"

  let q1 =
    create_question "Which of the followings are true?"
      [
        { content = "You have rizz"; is_correct = true };
        { content = "I have rizz"; is_correct = false };
        { content = "bla bla"; is_correct = true };
        { content = "metocondria is the power the cell"; is_correct = true };
      ]

  let q2 =
    create_question "What did Prof. White do in undergrad?"
      [
        { content = "math"; is_correct = true };
        { content = "cocacolaine"; is_correct = false };
        { content = "chem"; is_correct = false };
        { content = "marryjuana"; is_correct = false };
      ]

  let q3 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q4 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q5 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q6 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q7 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q8 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q9 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let q10 =
    create_question "question huh huh?"
      [
        { content = "1"; is_correct = true };
        { content = "2"; is_correct = false };
        { content = "3"; is_correct = false };
        { content = "4"; is_correct = false };
      ]

  let course = add_question course q1
  let course = add_question course q2
  let course = add_question course q3
  let course = add_question course q4
  let course = add_question course q5
  let course = add_question course q6
  let course = add_question course q7
  let course = add_question course q8
  let course = add_question course q9
  let course = add_question course q10
end
