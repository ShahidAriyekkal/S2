import java.util.*;
import java.io.*;
class arraysearch
{
        public static void main(String args[])
        {
                int k=0,i,n,x;
                Scanner z=new Scanner(System.in);

                System.out.println("Enter the number of Elements :");
                n=z.nextInt();
                int []a=new int[n];

                System.out.println("Enter the array Elements : ");

                for(i=0;i<n;i++)
                {
                        a[i]=z.nextInt();
                }

                System.out.println("Enter the Element you want to search : ");
                x=z.nextInt();

                for(i=0;i<n;i++)
                {
                if(a[i]==x)
                {
                        i++;
                        System.out.println("The value is found at : "+i+"th position ");
                        k=1;
                        break;
                }
                }

                if(k==0)
                {
                        System.out.print("The Element is not in the array ");
                }
        }
}
