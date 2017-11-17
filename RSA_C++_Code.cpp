#include<iostream>
#include<iomanip>
#include<math.h>

using namespace std; 
struct node
{
  int data;
  node * next;
};
char Reverse_Mapping_Request(char[26],int);
unsigned long long int raise_to_pow(int, int);
bool is_not_prime(int value);
bool is_out_of_range(int value);
void calculating_possible_e_values(node *& , int);
int  calculating_corresponding_d_value(int , int);
void add_value_to_linked_list(node*& , int);
bool is_e_invalid(node*&, int);
void print_list(node*&);
int  mapping_char_to_int(char );
void plain_text_adding_operations(node *& , int);
int  list_size (node *&);
int  Access_specific_value_in_list(node *&, int);
int  main () 
{
  
  cout << "This program simulate the Encryption and Decryption for RSA Cipher |" <<endl;
  cout << "====================================================================" <<endl;
  
  int p,q;              // Prime Numbers used in RSA Public/Private Keys Creations..
  do                    // Start From Here if p or q is out of range.. 
  {
  cout << "Please Enter The Two Prime Numbers between (2 - 1000) : " << endl;
  cout << "Enter p : ";
  cin >> p;             // Getting p Value
  if(is_out_of_range(p))
  {
    cout << "Sorry p value is out of range try again!" <<endl;
  cout << "====================================================================" <<endl;
    continue;
  }  
  if (is_not_prime(p))
  {
    cout << "Sorry p value is not a prime try again" <<endl;
  cout << "====================================================================" <<endl;
    continue;
  }
  ///////////////////////////////////////////////////////////////////////
  false_entry:
  cout << "Enter q : ";
  cin >> q;             // Getting q Value
  if(is_out_of_range(q))
  {
    cout << "Sorry q value is out of range try again!" <<endl;
  cout << "====================================================================" <<endl;
    goto false_entry;
  }
  if (is_not_prime(q))
  {
    cout << "Sorry p value is not a prime try again" <<endl;
  cout << "====================================================================" <<endl;
    goto false_entry;
  }
  cout << "====================================================================" <<endl;
  break;
  }
  while(true);
  
  ///////////////////////////////////////////////////////////////////////
  
  cout << "Calcualating  n and ø(n) .. " << endl;
  int n = p * q; 
  int phi = (p-1) * (q-1);
  cout << "n   = " << n   << endl;
  cout << "phi = " << phi << endl;
  
  cout << "====================================================================" <<endl;
  
  cout << "Calculating possible e's .. " <<endl;
  node * e_sptr = NULL;
  calculating_possible_e_values(e_sptr,phi);
  
  cout << "====================================================================" <<endl;
  
  cout << "Choose \" e \" from the List above : "; 
  int e;
  do
  {
    cin >> e;
    if(is_e_invalid(e_sptr,e))
    {
    cout << "Sorry !! \nThe value of 'e' you entered is invalid."<<endl;
    cout << "Please choose a valid one from the below list : "<<endl;
    print_list(e_sptr);
    cout << "====================================================================" <<endl;
    cout << "Enter the Value";
    continue;
    }
    break;
  }
  while(true);
  
  cout << "====================================================================" <<endl;
  ///////////////////////////// Calculating Corresponding d ///////////////////////////
  int d = calculating_corresponding_d_value(phi , e);
  cout << "The Corresponding d Value is : " << d <<endl;
  cout << "====================================================================" <<endl;
  // Start of Plain_Text Linked List
  node * p_sptr = NULL;          
  // Store a value that determine whether the Stored value number or charachter
  node * p_indicator_sptr = NULL;  
  cout << "Please Enter the Plain Text - ( 0 < Must be < " <<n <<" )." <<endl;
  
  cout << "===================================================" <<endl;
  
  do
  {
  cout << "Select one of the following : "<<endl;
  cout << "1 - Number." << endl;
  cout << "2 - Charachter." << endl;
  cout << "Enter your Choice : ";
  int choice;
  cin >> choice;
  if(choice != 1 && choice != 2)
  {
    cout << "-----------" << endl;
    cout << "Bad Choice." << endl;
    cout << "-----------" << endl;
    continue;
  }
  cout << "===================================================" <<endl;
  switch(choice)
  {
    case 1:
          cout << "Please Enter a Numeral Value : ";
          int num;
          cin >> num;
          plain_text_adding_operations(p_sptr , num);
          plain_text_adding_operations(p_indicator_sptr,1);
          break;
    case 2:
          cout << "Please enter a specific charachter : ";
          char ch;
          cin >> ch;
          int num_associated_with_char = mapping_char_to_int(ch);
          plain_text_adding_operations(p_sptr , num_associated_with_char);
          plain_text_adding_operations(p_indicator_sptr,0);
          break;
  }
  cout << "---------------------------------"<< endl;
  cout << "Adding Extra Values or charachters ? (Y/N) : ";
  char adding_more;
  cin >> adding_more;
  cout << "===================================================" <<endl;
  if(adding_more == 'Y' || adding_more == 'y' )
  {
    continue;
  }
  else
  {
    break;
  }
  }
  while(true);

  //////////////////////////Generating The Ciphe Text/////////////////////////////////
  cout << "==================Encrypting=======================" <<endl;
  char Alphapetic [26] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
  node * c_sptr = NULL;
  for(int i = 0 ; i < list_size(p_sptr) ; i++)
  {
    int plain_value = Access_specific_value_in_list(p_sptr,i);
    unsigned long long int  temp = raise_to_pow(plain_value ,e);
    int encrypted_value = temp % n ;
    add_value_to_linked_list(c_sptr, encrypted_value);
    if (Access_specific_value_in_list(p_indicator_sptr,i) == 0)
    {
      cout << setw(2) <<  Reverse_Mapping_Request(Alphapetic,plain_value);
    }
    else
    {
      cout << setw(2) <<  plain_value;;
    }
    cout << " =======Encrypted To=======>  " << setw(2) << encrypted_value<<endl;
  }
  //////////////////////////Generating The plain text/////////////////////////////////
  cout << "==================Decrypting=======================" <<endl;
  node * s_sptr = NULL;          // Final Solution
  for(int i = 0 ; i < list_size(c_sptr) ; i++)
  {
    int encrypted_value = Access_specific_value_in_list(c_sptr,i);
    unsigned long long int  temp = raise_to_pow(encrypted_value , d);
    int plain_value = temp % n ;
    add_value_to_linked_list(s_sptr, plain_value);
    cout << setw(2) << encrypted_value << " =======Decrypted To=======>  ";
    if (Access_specific_value_in_list(p_indicator_sptr,i) == 0)
    {
      cout << setw(2) <<  Reverse_Mapping_Request(Alphapetic,plain_value) <<endl;
    }
    else
    {
      cout << setw(2 ) <<  plain_value <<endl;
    }
  }
  return 0;                      // End of Main Function
}
char Reverse_Mapping_Request(char Alphapetic [26],int Value)
{
    for(int i = 0 ; i <= 25 ; i++)
    {
        if(Value == i)
        {
            return Alphapetic[Value];
        }
    }
}
unsigned long long int  raise_to_pow(int x, int power)
{
    int result;
    int i;
    result = 1;
    for (i=1; i<=power;i++)
    {
        result = result*x;
    }
    return(result);
}
int Access_specific_value_in_list(node *& sptr, int index)
{
  node * assistant_ptr = sptr;
  int count = 0;
  while(assistant_ptr != NULL)
  {
    if (count == index)
    {
      return assistant_ptr->data;
    }
    else
    {
      assistant_ptr = assistant_ptr->next;
      count++;
    }
  }
}
int calculating_corresponding_d_value(int phi , int e)
{
  for(int i = 0 ; i < phi ; i++)
  {
    if(( i * e) % phi == 1)
    {
      return i;
    }
  }
}
int list_size (node *& sptr)
{
  int size = 0;
  node * assistant_ptr = sptr;
  while (assistant_ptr != NULL)
  {
    size++;
    assistant_ptr = assistant_ptr -> next;
  }
  return size;
}
void plain_text_adding_operations(node *& sptr , int value)
{
  node * temp = new node; 
  temp -> data = value;
  temp -> next = NULL;
  if(sptr == NULL)
  {
    sptr = temp;
  }
  else
  {
    node * assistant_ptr = sptr;
    while (assistant_ptr -> next != NULL)
    {
      assistant_ptr = assistant_ptr -> next;
    }
    assistant_ptr -> next = temp;
  }
}
int mapping_char_to_int(char ch)
{
  char Alphapetic [26] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
  for(int i = 0 ; i < 26 ; i++)
  {
    if(Alphapetic[i] == ch)
    return i;
  }
}
void print_list(node*& e_sptr)
{
  node * assistant_ptr = e_sptr;
  while(assistant_ptr != NULL)
  {
    cout << assistant_ptr -> data << endl; 
    assistant_ptr = assistant_ptr->next;
  }
}
bool is_e_invalid(node *& e_sptr, int e)
{
  node * assistant_ptr = e_sptr;
  while(assistant_ptr != NULL)
  {
    if(assistant_ptr -> data == e)
    {
      return false;
    }
    assistant_ptr = assistant_ptr->next;
  }
  return true;
}
void calculating_possible_e_values(node *& e_sptr , int phi)
{
  for(int e = 2 ; e < phi ; e++)
  {
    if(phi % e != 0)
    {
      // 5 7 9 10 11 13 14 15 16 17 18 19 20 21 22 23 //
      int count = 0;
      for(int j = 2 ; j < e ; j++)
      {
        if(e%j == 0)
        {
          count++;
        }
      }
    if(count == 0)
    {
      cout << "                     " <<e <<endl;
      add_value_to_linked_list(e_sptr , e);
    }
    }
  }
}
void add_value_to_linked_list(node *& e_sptr , int value)
{
  node * temp = new node;
  temp -> data = value;
  temp ->next = NULL;
  if(e_sptr == NULL)
  {
    e_sptr = temp;
  }
  else
  {
    node * assistant_ptr = e_sptr;
    while(assistant_ptr -> next != NULL)
    {
      assistant_ptr = assistant_ptr->next;
    }
    assistant_ptr-> next = temp;
  }
}
bool is_not_prime(int value)
{
  int count = 0;
  for(int i = 2 ; i < value ; i++)
  {
    if(value % i == 0)
    {
      count++;
    }
  }
  if (count > 0)
  {
    return true;
  }
  else
  {
    return false;
  }
}
bool is_out_of_range(int value)
{
  if(value > 1000)
  {
    return true;
  }
  else
  {
    return false;
  }
}