package com.healthcare.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 生成验证码
 * @Title: CaptchaController
 * @Description: TODO 
 *
 * @author: 114-FEI
 * @date: 2017年1月3日 下午5:34:14
 *
 */
@Controller
@RequestMapping("/captcha")
public class CaptchaController {
	
	private int width = 90;
	private int height = 34;
	private int codeCount = 4;
	private int xx =15;
	private int fontHeight = 24;
	private int codeY = 24; 	// 验证码出现在图片中的Y轴位置，方向从上至下
	private char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
	
	private int[] fontStyle = {Font.PLAIN, Font.BOLD, Font.ITALIC, Font.BOLD + Font.ITALIC};
	
	@RequestMapping(value = "/getCaptcha")
	public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 定义图像buffer
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		Graphics graph = buffImg.getGraphics();
		
		// 创建随机数生成器
		Random random = new Random();
		
		// 将图像填充为白色
		graph.setColor(Color.WHITE);
		graph.fillRect(0, 0, width, height);
		
		// 绘制边框
		graph.setColor(Color.LIGHT_GRAY);
		graph.drawRect(0, 0, width -1, height - 1);
		
		// 随机产生干扰线
		graph.setColor(Color.GRAY);
		for (int i = 0; i < 40; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int x1 = random.nextInt(15);
			int y1 = random.nextInt(15);
			//graph.drawRect(x, y, x + x1, y + y1);
			graph.drawLine(x, y, x + x1, y + y1);
		}
		
		// randomCaptcha用于保存随机产生的验证码数据
		StringBuffer randomCaptcha = new StringBuffer();
		
		int red = 0, green = 0, blue = 0;

		// 随机产生randomCaptcha数据验证码
		for (int i = 0; i < codeCount; i++) {
			
			// 创建字体，大小应该根据图片的高度来定
			Font font = new Font("Fixedsys", fontStyle[random.nextInt(4)], fontHeight);
			
			// 设置字体
			graph.setFont(font);
			
			// 得到随机产生的验证码数字
			String code = String.valueOf(codeSequence[random.nextInt(36)]);
			
			// 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);
			
			// 用随机产生的颜色将验证码绘制到图像中
			graph.setColor(new Color(red, green, blue));
			graph.drawString(code, (i + 1) * xx, codeY);
			
			// 将产生的4个随机数组合在一起
			randomCaptcha.append(code);
		}
		
		// 将4位数字的验证码保存到Session中
		HttpSession session = request.getSession();
		session.setAttribute("captcha", randomCaptcha.toString());
		
		// 禁止图像缓存
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.addDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		
		// 将图像输出到Servlet输出流中
		ServletOutputStream sos = response.getOutputStream();
		ImageIO.write(buffImg, "jpeg", sos);
		sos.close();

	}
}


















