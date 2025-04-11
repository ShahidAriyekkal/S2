import java.util.Scanner;

public class symmetricmatrix
{
public static void main(String[] args)
{
Scanner sc=new Scanner(System.in);
int i,j;
System.out.println("Enter The size of a matrix:   ");
int r=sc.nextInt();
int[][]a=new int[r][r];
int[][]b=new int[r][r];
System.out.println("Enter the matrix elements: ");
for(i=0;i<r;i++)
{
for(j=0;j<r;j++)
{
a[i][j]=sc.nextInt();
}
}
boolean sym=true;

for(i=0;i<r;i++)
{
for(j=0;j<r;j++)
{
if(a[i][j]!=a[j][i])
{
sym=false;
break;
}
}
}
if(sym)
{
System.out.println("matrix is symmetric");
}
else
{
System.out.println("matrix is not symmetric");
}
}
}
