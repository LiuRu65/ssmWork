package cn.controller;

import cn.bean.Emp;
import cn.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.swing.text.AbstractDocument.Content;

import java.util.Date;
import java.util.List;

/**
 * @author LR
 * @date 2019/12/04
 **/

@Controller
public class EmpController {

    @Autowired
    private EmpService es;

    @Autowired
    private JavaMailSenderImpl mailSender;

    @RequestMapping("EmpShow")
    public String EmpShow(Model model){
        List<Emp> empList = es.selectByAll(new Emp());
        model.addAttribute("empList",empList);
        return "EmpShow";
    }

    @RequestMapping("delEmp")
    public String del(Integer empno){
        int i = es.deleteByPrimaryKey(empno);
        return "redirect:/EmpShow.jsp";
    }

    @RequestMapping("addEmp")
    @ResponseBody
    public boolean addEmp(@RequestBody Emp emp){
        int i = es.insert(emp);
        return i>0?true:false;
    }

    @RequestMapping("selectByeno")
    @ResponseBody
    public Emp selectByeno(Integer eno){
        Emp emp = es.selectByPrimaryKey(eno);
        return emp;
    }

    @RequestMapping("updateEmp")
    @ResponseBody
    public boolean updateEmp(@RequestBody Emp emp){
        int i = es.updateByPrimaryKey(emp);
       return i>0?true:false;
    }
    //分页
    @RequestMapping("EmpShow2")
    public void EmpShow2(Model model){

    }

    //模糊查询
    @RequestMapping("like")
    @ResponseBody
    public List<Emp> like(@RequestParam("likeEname") String likeEname){
        System.out.println("like...."+likeEname);
        List<Emp> likelist = es.findByEnameLike(likeEname);
        System.out.println("zhelishi...."+likelist);
        return likelist;
    }

    //发送邮件
    @RequestMapping("sendmail")
    @ResponseBody
    public String sendMail(MultipartFile fujian){

        try {
            MimeMessage message = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setSubject("主题邮件发送");
            helper.setText("邮件内容");
            helper.addAttachment(fujian.getOriginalFilename(),fujian);
            helper.setSentDate(new Date());

            helper.setFrom("17691219246@163.com");

            helper.setTo(new String[]{"1104050354@qq.com","17691219246@163.com","974900744@qq.com"});

            mailSender.send(message);

            return "success";

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return "fail";
    }


}
