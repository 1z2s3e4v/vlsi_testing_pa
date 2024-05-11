#include<iostream>
using namespace std;
int main(int argc, char** argv){
	int a = stoi(argv[1]);
	switch(a){
		case 1:
		case 2:
		case 3:
			cout << "HI\n";
			break;
		case 4:
		case 5:
			cout << "HI2\n";
			break;
		case 6:
			break;
	}

}
