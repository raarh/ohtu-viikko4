package ohtu;

import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Set;

/*
* {"id":75,
* "student_number":"013922104",
* "last_name":"",
* "first_name":"",
* "week":1,
* "points":null,
* "identifier":"",
* "hours":3,
* "comments":""
* ,"email":""
* ,"a1":true,
* "a2":true,
* "a3":true,
* "a4":true,"a5":true,"a6":true,"a7":true,"a8":true,"a9":true,"a10":true,"a11":true,"a12":null,"a13":null,"a14":null,"a15":null,"a16":null,"a17":null,"a18":null,"a19":null,"a20":null,"a21":null,
* "created_at":"2016-03-20T12:13:47.336Z","updated_at":"2016-03-20T12:13:47.336Z","course_id":1,"github":"","student_id":null,"challenging":null},*/
public class Submission {
    private String student_number;
    private int week;
    private int hours;
    private int amount;
    private boolean a1;
    private boolean a2;
    private boolean a3;
    private boolean a4;
    private boolean a5;
    private boolean a6;
    private boolean a7;
    private boolean a8;
    private boolean a9;
    private boolean a10;
    private boolean a11;
    private boolean a12;
    private boolean a13;
    private boolean a14;
    private boolean a15;
    private boolean a16;
    private boolean a17;
    private boolean a18;
    private boolean a19;
    private boolean a20;
    private boolean a21;
     public Submission(){

    }
    public String getStudent_number() {
        return student_number;
    }

    public void setStudent_number(String student_number) {
        this.student_number = student_number;
    }
    private String tehdyt(){
        amount = 0;
        StringBuilder sb = new StringBuilder();
        if(a1){
            sb.append("1 ");
                    amount++;
        }
        if(a2){
            sb.append("2 ");
            amount++;
        }
        if(a3){
            sb.append("3 ");
            amount++;
        }
        if(a4){
            sb.append("4 ");
            amount++;
        }
        if(a5){
            sb.append("5 ");
            amount++;

        }
        if(a6){
            sb.append("6 ");
            amount++;
        }
        if(a7){
            sb.append("7 ");
            amount++;
        }
        if(a8){
            sb.append("8 ");
            amount++;
        }
        if(a9){
            sb.append("9 ");
            amount++;
        }
        if(a10){
            sb.append("10 ");
            amount++;
        }
        if(a11){
            sb.append("11 ");
            amount++;
        }
        if(a12){
            sb.append("12 ");
            amount++;
        }
        if(a13){
            sb.append("13 ");
            amount++;
        }
        if(a14){
            sb.append("14 ");
            amount++;
        }
        if(a15){
            sb.append("15 ");
            amount++;
        }
        if(a16){
            sb.append("16 ");
            amount++;
        }
        if(a17){
            sb.append("17 ");
            amount++;
        }
        if(a18){
            sb.append("18 ");
            amount++;
        }
        if(a19){
            sb.append("19 ");
            amount++;
        }
        if(a20){
            sb.append("20 ");
            amount++;
        }
        if(a21){
            sb.append("21 ");
            amount++;
        }
        return  sb.toString();
    }
    @Override
    public String toString() {
        String tehdyt = tehdyt();
        return "Viikko "+week +": tehtyjä tehtäviä yhteensä: "+this.amount+", aikaa kului "+ this.hours +"tuntia, tehdyt tehtävät:" + tehdyt;
    }


}