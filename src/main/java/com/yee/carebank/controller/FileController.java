package com.yee.carebank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yee.carebank.model.biz.AwsS3Biz;
import com.yee.carebank.model.dto.UserDto;

import static com.yee.carebank.controller.Admin1stController.check;

@Controller
@PropertySource("classpath:aws/credentials.properties")
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private AwsS3Biz s3Service;

	@Value("${bucketname}")
	private String bucketName;

	@RequestMapping(value = "admin/upload.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFile(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
		logger.info("IMAGE UPLOAD");
		if (check((UserDto) request.getSession().getAttribute("login_info"))) {
			return null;
		}

		String originalFileName = file.getOriginalFilename();
		String uuidFileName = getUuidFileName(originalFileName);

		String res = s3Service.uploadObject(file, uuidFileName);
		System.out.println(res);
		return "https://" + bucketName + ".s3.ap-northeast-2.amazonaws.com/img/" + uuidFileName;
	}

	@RequestMapping("admin/upreq.do")
	public String loadPage(HttpSession session) throws Exception {
		logger.info("IMAGE UPLOAD");
		if (check((UserDto) session.getAttribute("login_info"))) {
			return "redirect: ../main.do";
		}

		return "admin/upload";

	}

	private static String getUuidFileName(String originalFileName) {
		return UUID.randomUUID().toString() + "_" + originalFileName;
	}
}
