package cn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

/**
 * @author LR
 * @date 2019/12/03
 **/

@Controller
public class UploadController {
//第一种
    @RequestMapping("upload")
    @ResponseBody
    public String upload(MultipartFile uploadFile) throws Exception{
        //获取上传文件真实名称
        String fileName = uploadFile.getOriginalFilename();

        String uploadPath="F:\\headphoto\\";

        uploadFile.transferTo(new File(uploadPath+fileName));
        return "success";
    }
    //多个文件
    @RequestMapping("upload2")
    @ResponseBody
    public String upload2(MultipartFile[] uploadFile) throws Exception{

        for (MultipartFile multipartFile : uploadFile) {
            //获取上传文件真实名称
            String fileName = multipartFile.getOriginalFilename();
            String uploadPath="F:\\headphoto\\";

            multipartFile.transferTo(new File(uploadPath+fileName));

        }
        return "success";
    }

//第二种ajax
    @RequestMapping("ajaxupload")
    @ResponseBody
    public String upload3(MultipartFile uploadFile) throws Exception{
        String fileName = uploadFile.getOriginalFilename();

        String uploadPath="F:\\headphoto\\";

        uploadFile.transferTo(new File(uploadPath+fileName));
        return "success";
    }
    //普通字段+文件
    @RequestMapping("ajaxupload2")
    @ResponseBody
    public String upload4(MultipartHttpServletRequest mf) throws Exception{

        MultipartFile uploadFile = mf.getFile("uploadFile");

        //多个文件时
        //List<MultipartFile> list = mf.getFiles("uploadFile");

        Enumeration names = mf.getParameterNames();
        while(names.hasMoreElements()){
            String name = (String) names.nextElement();
            String value = mf.getParameter(name);
            System.out.println(name+" "+value);
        }
        return "success";
    }

}
