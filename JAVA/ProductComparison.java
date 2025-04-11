import java.util.Scanner;
class Product{
        int p_code;
        String p_name;
        int price;

        Product(){
        Scanner sc=new Scanner(System.in);
                this.p_code=sc.nextInt();
                this.p_name=sc.next();
                this.price=sc.nextInt();
        }

        public static void main(String[] args){


          Product p1=new Product();
          Product p2=new Product();
          Product p3=new Product();
          if(p1.price>p2.price &&  p1.price>p3.price){
                System.out.println("p1 is greater "+p1.p_name+" "+p1.price);
          }
          else if(p2.price>p3.price){
                System.out.println("p2 is greater");
          }
          else{
                System.out.println("p3 is greater");
          }

     }
}
