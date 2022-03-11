#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    vector<string> msg {"Hello", "C++", "World"};

    for (const string& w : msg)
    {
        cout << w << " ";
    }
    cout << endl;
}