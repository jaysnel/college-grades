// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.0 <=0.8.20;

contract CollegeGrades {
    // Struct to store information about a course
    struct Course {
        string name;
        uint credits;
        uint grade;
    }

    // Struct to store information about a student
    struct Student {
        string name;
        uint age;
        address payable wallet;
        Course[] courses;
    }

    // Mapping from student ID to student struct
    mapping(uint => Student) public students;

    // Counter to track the number of students
    uint public studentCount;

    // Event to be emitted when a student is added
    event StudentAdded(uint id, string name, uint age, address payable wallet);

    // Event to be emitted when a course is added
    event CourseAdded(uint id, string name, uint credits, uint grade);

    // Add a new student to the contract
    function addStudent(Student memory newStudent) public {

        require(newStudent.wallet == address(0), "Student with that wallet/address already exists !!!");

        // Geting student id
        uint id = studentCount++;

        // Setting all student values except courses
        students[id].name = newStudent.name;
        students[id].age = newStudent.age;
        students[id].wallet = newStudent.wallet;

        emit StudentAdded(id, newStudent.name, newStudent.age, newStudent.wallet);
    }

    // Add a new course to a student's record
    function addCourse(uint _studentId, Course memory newCourse) public {
        // Ensure the student exists
        require(students[_studentId].wallet != address(0), "Student does not exist");

        // Add the course to the student's record
        Student storage student = students[_studentId];

       // Adding new course to the array of all the Studen't Courses
        student.courses.push(newCourse);

        emit CourseAdded(_studentId, newCourse.name, newCourse.credits, newCourse.grade);
    }

    // Calculate the GPA of a student
    function getGPA(uint _studentId) public view returns (uint) {
        // Ensure the student exists
        require(students[_studentId].wallet != address(0), "Student does not exist");

        // Calculate the GPA
        Student storage student = students[_studentId];
        uint totalCredits = 0;
        uint totalPoints = 0;
        for (uint i = 0; i < student.courses.length; i++) {
            Course storage course = student.courses[i];
            totalCredits += course.credits;
            totalPoints += course.credits * course.grade;
        }
        return totalPoints / totalCredits;
    }
}