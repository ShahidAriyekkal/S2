import java.util.Scanner;
class Matrixadd{
public static void main(String[] args){
Scanner sc=new Scanner(System.in);
int row,col,i,j;

System.out.println("enter number of  row ,col");
row=sc.nextInt();
col=sc.nextInt();
int a[][]=new int[row][col];
int b[][]=new int[row][col];
int sum[][]=new int[row][col];

System.out.println("enter the elements first matrix:");
for(i=0;i<row;i++){
for(j=0;j<col;j++){
a[i][j]=sc.nextInt();
}
}

System.out.println("enter the elements second matrix:");
for(i=0;i<row;i++){
for(j=0;j<col;j++){
b[i][j]=sc.nextInt();
}
}


for(i=0;i<row;i++){
for(j=0;j<col;j++){
sum[i][j]=a[i][j]+b[i][j];
}
}

System.out.println("sum of matrix");
for(i=0;i<row;i++){
for(j=0;j<col;j++){
System.out.print(sum[i][j]+" ");
}
System.out.println();
}


}
}
