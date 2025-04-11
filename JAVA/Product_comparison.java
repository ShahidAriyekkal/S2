import java.io.*;
import java.util.*;
class product
{
int pcode;
String pname;
int price;
Scanner t=new Scanner (System.in);
product()
{
System.out.print("Enter the pcode,pname,price  :");
pcode=t.nextInt();
pname=t.next();
price=t.nextInt();
}
int prc()
{
return price;
}
void display()
{
System.out.println("Pname : "+pname+"\n"+"Pcode : "+pcode+"\n"+"price : "+price+"\n");
}
}
class productcomparison
{
public static void main(String []args)
{
product z=new product();
product y=new product();
product x=new product();
int a=z.prc();
int b=y.prc();
int c=x.prc();
if(a>b && a>c)
{
System.out.print("The product with hightest price is : \n");
z.display();
}
else if (b>c)
{
System.out.print("The product with highest price is : \n");
y.display();
}
else
{
System.out.print("The product with highest price is : \n");
x.display();
}
}
