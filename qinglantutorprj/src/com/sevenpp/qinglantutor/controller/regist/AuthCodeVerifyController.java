package com.sevenpp.qinglantutor.controller.regist;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sevenpp.qinglantutor.util.email.EmailUtil;
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> a5df4409c2b24d3a926bce9a28091aa8ed267097
=======
>>>>>>> a5df4409c2b24d3a926bce9a28091aa8ed267097

/**
*code is far away from bug with the animal protecting
*  ┏┓　　　┏┓
*┏┛┻━━━┛┻┓
*┃　　　　　　　┃ 　
*┃　　　━　　　┃
*┃　┳┛　┗┳　┃
*┃　　　　　　　┃
*┃　　　┻　　　┃
*┃　　　　　　　┃
*┗━┓　　　┏━┛
*　　┃　　　┃神兽保佑
*　　┃　　　┃代码无BUG！
*　　┃　　　┗━━━┓
*　　┃　　　　　　　┣┓
*　　┃　　　　　　　┏┛
*　　┗┓┓┏━┳┓┏┛
*　　　┃┫┫　┃┫┫
*　　　┗┻┛　┗┻┛ 
*　　　
* @author 作者 :Mr.Ren
* @version 创建时间：2018年12月5日 上午9:04:52
* 类说明
*/
@Controller
@Scope("prototype")
@RequestMapping("/authcode")
@ResponseBody
public class AuthCodeVerifyController {
	@RequestMapping(value="/verify", method=RequestMethod.POST)
	public void authCodeVerify(@RequestBody Map<String, String>map,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		PrintWriter writer;
		try {
			writer = response.getWriter();
			if(EmailUtil.checkCaptcha(map.get("email"), map.get("type"), map.get("authCode"), session)) {
				writer.write("succeed");
				writer.flush();
				writer.close();
			}else {
				writer.write("failed");
				writer.flush();
				writer.close();
			}
		} catch (IOException e) {
				
				
		}
	}
}