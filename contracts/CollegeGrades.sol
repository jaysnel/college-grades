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
    function addStudent(string memory _name, uint _age, address payable _wallet) public {
        uint id = studentCount++;
        // students[id] = Student(_name, _age, _wallet, new Course[]);
        emit StudentAdded(id, _name, _age, _wallet);
    }

    // Add a new course to a student's record
    // function addCourse(uint _studentId, string memory _name, uint _credits, uint _grade) public {
    //     // Ensure the student exists
    //     require(students[_studentId].name != "", "Student does not exist");

    //     // Add the course to the student's record
    //     Student storage student = students[_studentId];
    //     uint courseId = student.courses.length++;
    //     student.courses[courseId] = Course(_name, _credits, _grade);
    //     emit CourseAdded(_studentId, _name, _credits, _grade);
    // }

    // Calculate the GPA of a student
    function getGPA() public pure returns (uint) {
        // Ensure the student exists
        // require(students[_studentId].name != "", "Student does not exist");

        // Calculate the GPA
        // Student storage student = students[_studentId];
        uint totalCredits = 0;
        uint totalPoints = 0;
        // for (uint i = 0; i < student.courses.length; i++) {
        //     Course storage course = student.courses[i];
        //     totalCredits += course.credits;
        //     totalPoints += course.credits * course.grade;
        // }
        return totalPoints / totalCredits;
    }
}

