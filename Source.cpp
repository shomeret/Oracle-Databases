/*#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <iomanip>  
#include <occi.h>
#include <cctype>
#include <string>
#include <cstring>
#include <algorithm>


//Name: Alan Yanovich
 //St#: 021278106
 //email: ayanovich@myseneca.ca


using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;

//const int MAX_EMP = 30;
int menu(void);
int findEmployee(Connection* conn, int employeeNumber, struct Employee* emp);
void displayEmployee(Connection* conn, struct Employee emp);
void displayAllEmployees(Connection* conn);
void insertEmployee(Connection* conn, struct Employee emp);
void updateEmployee(Connection* conn, int employeeNumber);
void deleteEmployee(Connection* conn, int employeeNumber);


struct Employee {
	int employeeNumber = 0;
	char lastName[50] = "\0";
	char firstName[50] = "\0";
	char email[100] = "\0";
	char phone[50] = "\0";
	char extension[10] = "\0";
	char reportsTo[100] = "\0";
	char jobTitle[50] = "\0";
	char city[50] = "\0";
};

int main(void) {
	// OCCI Variables
	Environment* env = nullptr;
	Connection* conn = nullptr;
	// User variables
	string str;
	string usr = "dbs211_202d34"; // login 
	string pass = "13557316"; // password
	string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";

	
	try {
	
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);

		Employee employee;
		
		for (int menuReturn = menu();menuReturn >= 1 && menuReturn <= 5; menuReturn = menu())
		{

		switch (menuReturn) {
			case 1:
				displayEmployee(conn, employee);
				break;
			case 2:
				displayAllEmployees(conn);
				break;
			case 3: 
			{
				cout << "Employee Number: ";
				cin >> employee.employeeNumber;
				cout << "Last Name: ";
				cin >> employee.lastName;
				cout << "First Name: ";
				cin >> employee.firstName;
				cout << "Email: ";
				cin >> employee.email;
				cout << "Extension: ";
				cin >> employee.extension;
				cout << "Job Title: ";
				cin >> employee.jobTitle;
				cin.getline(employee.jobTitle, '\n');
				cout << "City: ";
				cin >> employee.city;
				insertEmployee(conn, employee);
			}
				break; 
			case 4:
			{
				int emplNum;
				cout << "Please enter Employee Number: ";
				cin >> emplNum;
				updateEmployee(conn, emplNum);
			}
				break;
			case 5:
			{
				int emplNum;
				cout << "Please enter Employee Number: ";
				cin >> emplNum;
				deleteEmployee(conn, emplNum);
			
			}
				break;
			}
		}
		
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException & sqlExcp) {
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}
	return 0;
}


int menu(void) {
	int value;
	cout << "********************* HR Menu *********************" << endl;
	cout << "1) Find Employee" << endl;
	cout << "2) Employees Report" << endl;
	cout << "3) Add Employee" << endl;
	cout << "4) Update Employee" << endl;
	cout << "5) Remove Employee" << endl;
	cout << "6) Exit" << endl;
	cout << "> ";

	cin >> value;

	while (value < 0 || value > 6) {
		cout << "Incorrect output, please enter the correct output: ";
		cin >> value;
	}
	
	return value;
}


int findEmployee(Connection* conn, int employeeNumber, struct Employee* emp) {
	Statement* stmt = conn->createStatement("SELECT "
		"Employees.employeenumber, "
		"Employees.lastname, "
		"Employees.firstname, "
		"Employees.email, "
		"Offices.phone, "
		"Employees.extension, "
		"(NVL(manager.firstname, '')  || ' ' ||  NVL(manager.lastname, '')) AS mname, "
		"Employees.jobtitle, "
		"Offices.City "
		"FROM Employees "
			"LEFT OUTER JOIN offices ON offices.officecode = employees.officecode "
			"LEFT OUTER JOIN Employees manager ON manager.employeenumber = employees.reportsto "
		"WHERE employees.employeenumber = :1");
	stmt->setInt(1, employeeNumber);

	ResultSet* rs = stmt->executeQuery();

	auto result = 0;

	if (rs->next()) {
			emp->employeeNumber = rs->getInt(1);

			auto lasN = rs->getString(2);

			strcpy(emp->lastName, lasN.c_str());
			
			string firN = rs->getString(3);
			strcpy(emp->firstName, firN.c_str());

			string email = rs->getString(4);
			strcpy(emp->email, email.c_str());

			string phone = rs->getString(5);
			strcpy(emp->phone, phone.c_str());

			string exten = rs->getString(6);
			strcpy(emp->extension, exten.c_str());

			string reportsto = rs->getString(7);
			strcpy(emp->reportsTo, reportsto.c_str());

			string jobTit = rs->getString(8);
			strcpy(emp->jobTitle, jobTit.c_str());

			string city = rs->getString(9);
			strcpy(emp->city, city.c_str());

		result = 1;
	}
	conn->terminateStatement(stmt);
		
	return result;
}


void displayEmployee(Connection* conn, struct Employee emp) {

	int empNum;
	cout << "Employee Number: ";
	cin >> empNum;
	if (findEmployee(conn, empNum, &emp)) {

	cout << endl;
	cout << "employeeNumber = " << emp.employeeNumber << endl;
	cout << "lastName = " << emp.lastName << endl;
	cout << "firstName = " << emp.firstName << endl;
	cout << "email = " << emp.email << endl;
	cout << "phone = " << emp.phone << endl;
	cout << "extension = " << emp.extension << endl;
	cout << "reportsTo = " << emp.reportsTo << endl;
	cout << "jobTitle = " << emp.jobTitle << endl;
	cout << "city = " << emp.city << endl;
	}
	else
		cout << "Employee " << empNum << " does not exist.";
}

void displayAllEmployees(Connection* conn) {
	Statement* stmt = conn->createStatement();
	
	ResultSet* rs = stmt->executeQuery(
		"SELECT "
		"Employees.employeenumber, "
		"Employees.firstname || ' ' ||Employees.lastname, "
		"Employees.email, "
		"Offices.phone, "
		"Employees.extension, "
		"(NVL(manager.firstname, '')  || ' ' ||  NVL(manager.lastname, '')) AS mname "
		"FROM Employees "
		"LEFT OUTER JOIN offices ON offices.officecode = employees.officecode "
		"LEFT OUTER JOIN Employees manager ON manager.employeenumber = employees.reportsto "
		"ORDER BY employees.employeenumber");

	cout << "E          " << "Employee Name         " << "        Email              " << "            Phone         " << "   Ext    " << "     Manager    " << endl;
	cout << "********************************************************************************************************************" << endl;
	bool isEmpty = true;
	while (rs->next()) {
		isEmpty = false;
		int eNum = rs->getInt(1);
		string fullN = rs->getString(2);
		string email = rs->getString(3);
		string phone = rs->getString(4);
		string exten = rs->getString(5);
		string reportsto = rs->getString(6);
		

		cout << setw(8) << left << eNum << setfill(' ') << left << setw(20) << fullN  << setw(40) << email << setfill(' ') << setw(20) << phone << setfill(' ') << setw(10) <<  exten << "  " << reportsto << endl;
	}
	if (isEmpty)
		cout << "There is no employees information to be displayed." << endl;
	conn->terminateStatement(stmt);
}


void insertEmployee(Connection* conn, struct Employee emp) {
	int result = findEmployee(conn, emp.employeeNumber, &emp);
	if (1 == result) {
		cout << "An employee with the same employee number exists." << endl;
		//return to menu	
	} else {
		// add employee
		Statement* stmt = conn->createStatement();

		static const char * _fieldnames[] {
			"EmployeeNumber",
			"LastName",
			"FirstName",
			"Extension",
			"Email",
			"OfficeCode",
			"ReportsTo",
			"JobTitle"
		};
		
		
		std::string sql = "INSERT INTO Employees "
			"values (:1, :2, :3, :4, :5, :6, :7, :8)";
		stmt->setSQL(sql);
		stmt->setInt(1, emp.employeeNumber);
		stmt->setString(2, emp.lastName);
		stmt->setString(3, emp.firstName);
		stmt->setString(4, emp.extension);
		stmt->setString(5, emp.email);
		stmt->setInt(6, 1);
		stmt->setInt(7, 1002);
		stmt->setString(8, emp.jobTitle);
		std::cout << __FILE__ << ":" << __LINE__ << " sql: " << sql << std::endl;
		stmt->executeUpdate();

		cout << "The new employee is added successfully" << endl;
		conn->terminateStatement(stmt);
	}

}
	void updateEmployee(Connection* conn, int employeeNumber) {
		int index = 0;
		Employee employee;
		int result = findEmployee(conn, employeeNumber, &employee);
		if (1 == result) {
			char newExten[9] = "\0";
			Statement* stmt = conn->createStatement();
			cout << "Please enter the new extension: ";
			cin >> newExten;
			stmt->setSQL(
				"UPDATE employees "
				"SET extension =:1 "
				"WHERE employeenumber =:2"); 
			// set the values of the parameters
			stmt->setString(1, newExten);
			stmt->setInt(2, employeeNumber);
			stmt->executeUpdate(); 
			conn->terminateStatement(stmt);
		} else
			cout << "The employee does not exist." << endl;
	}

	void deleteEmployee(Connection* conn, int employeeNumber) {
		Employee employee;
		int result = findEmployee(conn, employeeNumber, &employee);
		if (0 == result)
			cout << "The employee does not exist." << endl;
		else {
			Statement* stmt = conn->createStatement();
			stmt->setSQL(
				"DELETE employees "
				"WHERE employeenumber =:1"); 
			stmt->setInt(1, employeeNumber);
			stmt->executeUpdate(); 
			cout << "The employee is deleted." << endl;
			conn->terminateStatement(stmt);
		}
	}
	*/