package com.aishang.dao;

import com.aishang.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

// 加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-applicationContext.xml"})
public class IUserDaoTest {

    @Autowired
    private IUserDao dao;

    @Test
    public void testSelectUser() throws Exception {
        Scanner scan = new Scanner(System.in);
        boolean flag = false;
        while (flag)
            System.out.println("现有游戏如下");
        System.out.println("--------------------");
        System.out.println("1.wow 2.传奇 3.梦幻西游 4.永恒之塔 5.七龙珠ol");
        System.out.println("请输入您选择的游戏:");
        int choice = scan.nextInt();
        if (choice == 1 || choice == 2 || choice == 3 || choice == 4 || choice == 5) {
            if (choice == 1) {
                System.out.println("您选择了*wow*");
            } else if (choice == 2) {
                System.out.println("您选择了*传奇*");
            } else if (choice == 3) {
                System.out.println("您选择了*梦幻西游*");
            } else if (choice == 4) {
                System.out.println("您选择了*永恒之塔*");
            } else if (choice == 5) {
                System.out.println("您选择了*七龙珠ol*");
            }
            System.out.println("请输入您现在已经玩到的级别");
            int grade = scan.nextInt();
            if (grade < 20) {
                System.out.println("您还是新出茅庐的小菜鸟，加快步伐向前冲吧！！");
            } else if (grade < 40) {
                System.out.println("您已经开始行走江湖，算是小有成就了，加油！！");
            } else if (grade < 60) {
                System.out.println("您已经横扫天下了，离天下无敌还有差距，继续努力吧！！");
            } else {
                System.out.println("您已经天下无敌了，太牛了！！");
            }
            flag = false;
        } else {
            System.out.println(">>>>>您输入的游戏编号无效，请继续输入！！");
        }
    }
}