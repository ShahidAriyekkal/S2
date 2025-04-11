import java.util.Scanner;

public class matrix_multiplication {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the Number of rows and columns of the Matrix : ");
        int rowsA = sc.nextInt(), colsA = sc.nextInt();

        System.out.println("Enter the Number of rows and columns of Matrix : ");
        int rowsB = sc.nextInt(), colsB = sc.nextInt();

        if (colsA != rowsB) {
            System.out.println("Matrix multiplication not possible.");
            return;
        }

        int[][] A = new int[rowsA][colsA];
        int[][] B = new int[rowsB][colsB];
        int[][] result = new int[rowsA][colsB];

        System.out.println("Enter the Matrix Elements : ");
        for (int i = 0; i < rowsA; i++)
            for (int j = 0; j < colsA; j++)
                A[i][j] = sc.nextInt();


        System.out.println("Enter the Matrix Elements : ");
        for (int i = 0; i < rowsB; i++)
            for (int j = 0; j < colsB; j++)
                B[i][j] = sc.nextInt();

        for (int i = 0; i < rowsA; i++)
            for (int j = 0; j < colsB; j++)
                for (int k = 0; k < colsA; k++)
                    result[i][j] += A[i][k] * B[k][j];

        System.out.println("The Resultant Matrix is : ");
        for (int i = 0; i < rowsA; i++) {
            for (int j = 0; j < colsB; j++) {
                System.out.print(result[i][j] + " ");
            }
            System.out.println();
        }

   }
}
