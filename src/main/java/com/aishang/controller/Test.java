package com.aishang.controller;

public class Test {
    public static void main(String[] args) {

       /* int[] array = new int[6];
        for (int i = 0; i < 6; i++) {
            array[i]  = (int) ((Math.random()* 33)+1);
            for(int m = 0;m<i;m++){
                while(array[i]==array[m]){
                    i--;
                    break;
                }
            }
        }
        for (int j : array) {
            System.out.println(j);
        }*/

        int[] array = {10,23,12,4,2,20};
        for (int i = 0; i < array.length - 1; i++) {
            // 内层循环为当前i趟数 所需要比较的次数
            for (int j = 0; j < array.length - 1 - i; j++)
                if (array[j] > array[j + 1]) {
                    int temp = array[j]; // 交换位置之前，先把原有的值存放在变量中
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
        }

        //输出红号
        System.out.println("机选号码 红号：");
        for (int j : array) {
            System.out.println(j);
        }

    }
}
