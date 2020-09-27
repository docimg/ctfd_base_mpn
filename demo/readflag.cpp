#include<fstream>
#include <iostream>
using namespace std;
int main(int argc,char *argv[])
{
	cout << "here is you flag: ";
	ifstream flagfile("/flag");
    string temp;
    if (!flagfile.is_open())
    {
        cout << "read fail." << endl; 
    }
    while(getline(flagfile,temp))
    {
        cout << temp << endl;
    }
    flagfile.close();
    return 0;
}
