// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.0 <=0.8.20;
import "hardhat/console.sol";

contract CollegeGrades {
    address payable public owner;

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

    constructor() payable {
        owner = payable(msg.sender);
    }

    function checkIfWalletExists(address _wallet) public view returns (bool) {
        for (uint i = 0; i < studentCount; i++) {
            if (students[i].wallet == _wallet) {
                return true;
            }
        }
        return false;
    }

    // Add a new student to the contract
    function addStudent(string memory _name, uint _age, address payable _wallet) public {
        
        require(checkIfWalletExists(_wallet) != true, "Student with that wallet/address already exists !!!");
        
        // Geting student id
        uint id = studentCount++;

        // Setting all student values except courses
        students[id].name = _name;
        students[id].age = _age;
        students[id].wallet = _wallet;

        emit StudentAdded(id, _name, _age, _wallet);
    }

    // Add a new course to a student's record
    function addCourse(uint _studentId, string memory _name, uint _credits, uint _grade) public {
        // Ensure the student exists
        require(students[_studentId].wallet != address(0), "Student does not exist");

        // Add the course to the student's record
        Student storage student = students[_studentId];

       // Adding new course to the array of all the Students Courses
        student.courses.push(Course(_name, _credits, _grade));

        emit CourseAdded(_studentId, _name, _credits, _grade);
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

    // Get total student count
    function getTotalStudentCount() public view returns (uint) {
        return studentCount;
    }

    // Get list of students
    function getStudentData(uint _studentId) public view returns (Student memory) {
        return students[_studentId];
    }
}