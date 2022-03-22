#include <iostream>

int main()
{   
    const int size = 12;
    int sum=0;
    short data[size] = {
    20,134,6,28,126,16,31,100,240,66,20,55
    };
    for (int i=0; i < size; i+=2) {
        std::cout<<data[i]<<"-> \t";
        data[i] = (data[i] | 16)  ^ 16;
        std::cout << data[i] <<"- even number" << std::endl;
        if (i  == (size-1)) {
            sum += data[i];
            break;   
        }
        std::cout<<data[i+1]<<"-> \t";;
        data[i+1] = (data[i+1] | 8);
        std::cout << data[i+1] <<" - odd number "<< std::endl;
        sum += data[i]+data[i+1];
        
    }
    std::cout <<"sum = " <<sum <<"\n";
}