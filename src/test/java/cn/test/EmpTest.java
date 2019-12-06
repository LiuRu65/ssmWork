/*
package cn.test;

import cn.bean.Emp;
import cn.service.EmpService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

*/
/**
 * @author LR
 * @date 2019/12/04
 **//*


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class EmpTest {

    @Autowired
    private EmpService es;

    @Test
    public void EmpShow(){
        List<Emp> empList = es.selectByAll(new Emp());
        for (Emp emp : empList) {
            System.out.println(emp);
        }
    }

    @Test
    public void LikeShow(){
        List<Emp> ford = es.findByEnameLike("M");
        for (Emp emp : ford) {
            System.out.println(emp);
        }

    }


}
*/
