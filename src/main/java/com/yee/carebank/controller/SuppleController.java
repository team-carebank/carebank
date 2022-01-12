package com.yee.carebank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yee.carebank.model.biz.CommentBiz;
import com.yee.carebank.model.biz.SuppleBiz;
import com.yee.carebank.model.dto.CommentDto;
import com.yee.carebank.model.dto.ShoppingDto;
import com.yee.carebank.model.dto.SuppleDto;
import com.yee.carebank.model.dto.UserDto;

@Controller
public class SuppleController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	SuppleBiz sBiz;
	@Autowired
	CommentBiz cBiz;

	@RequestMapping("/supplemain.do")
	public String sMain(Model model) {
		logger.info("INFO - MAIN [SUPPLEMENT]");

		model.addAttribute("category", sBiz.selectCatList());

		return "supplelist";
	}

	@RequestMapping("/supplelist.do")
	@ResponseBody
	public Map<String, Object> selectSList(@RequestBody int subcat_id) {
		logger.info("INFO - SELECT LIST [SUPPLEMENT]");

		Map<String, Object> res = new HashMap<String, Object>();

		res.put("supple", sBiz.selectList(subcat_id));

		return res;
	}

	@RequestMapping("/suppleinfo.do")
	public String selectSupple(Model model, int id) {
		logger.info("INFO - REQUEST DETAIL [SUPPLEMENT]");

		SuppleDto supple = sBiz.selectOne(id);
		List<String> description = sBiz.selectInfo(id);
		List<ShoppingDto> shopping = sBiz.getShopping(supple.getSupple_name());
		List<CommentDto> comment = cBiz.selectList(id, 3);

		model.addAttribute("supple", supple);
		model.addAttribute("description", description);
		model.addAttribute("shopping", shopping);
		model.addAttribute("comment", comment);

		return "suppleinfo";
	}

	@RequestMapping("/supplecomm.do")
	@ResponseBody
	public boolean write(HttpSession session, @RequestBody String data) {
		logger.info("INFO - WRITE A COMMENT [SUPPLEMENT]");

		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int info_id = jo.get("info_id").getAsInt();
		String comment = jo.get("comment").getAsString();

		UserDto loginUser = (UserDto) session.getAttribute("login_info");

		CommentDto dto = new CommentDto();

		int res = 0;

		try {
			dto.setInfo_id(info_id);
			dto.setContent(comment);
			dto.setUser_no(loginUser.getUser_no());

			res = cBiz.write(dto, 3);
		} catch (Exception e) {
			logger.error("ERROR - LOGIN DATA NOT FOUND");
			return false;
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/scommupdate.do")
	@ResponseBody
	public boolean modify(HttpSession session, @RequestBody String data) {
		JsonObject jo = new JsonParser().parse(data).getAsJsonObject();
		int comm_no = jo.get("comm_no").getAsInt();
		String comment = jo.get("comment").getAsString();

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int res = 0;

		try {
			CommentDto before = cBiz.read(comm_no, 3);

			if (before.getUser_no() != loginUser.getUser_no()) {
				logger.error("ERROR - UNAUTHORIZED USER");
				return false;
			}

			CommentDto after = new CommentDto();
			after.setComm_no(comm_no);
			after.setContent(comment);

			res = cBiz.update(after, 3);
		} catch (Exception e) {
			logger.error("ERROR - LOGIN OR COMMENT DATA IS NOT FOUND");
			return false;
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/scommdelete.do")
	@ResponseBody
	public boolean delete(HttpSession session, @RequestBody int comm_no) {
		logger.info("INFO - DELETE A COMMENT [SUPPLEMENT]");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int res = 0;

		try {
			CommentDto before = cBiz.read(comm_no, 1);
			if (before.getUser_no() != loginUser.getUser_no()) {
				logger.info("ERROR - UNAUTHORIZED USER");
				return false;
			}
			res = cBiz.delete(comm_no, 3);
		} catch (Exception e) {
			logger.error("ERROR - DELETE ERROR");
			return false;
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("prefer/supplelist.do")
	public String prefer(HttpSession session, Model model) {
		logger.info("INFO - GET PREFER LIST [SUPPLEMENT]");

		UserDto loginUser = (UserDto) session.getAttribute("login_info");
		int user_no;

		try {
			user_no = loginUser.getUser_no();
			List<Integer> prefer = sBiz.selectPreferCat(user_no);
			model.addAttribute("prefer", prefer);
			model.addAttribute("random", sBiz.selectRandom(user_no));
			model.addAttribute("comment", sBiz.selectByComment());

			try {
				model.addAttribute("supple", sBiz.selectList(prefer.get(0)));
			} catch (Exception e) {
				logger.error("ERROR - PREFERENCE IS NOT SET");
				model.addAttribute("msg", "선호도를 체크한 후에 이용이 가능합니다!");

				return "msg/alert";
			}
		} catch (Exception e) {
			logger.info("ERROR - LOGIN DATA IS NOT FOUND");
			return "redirect: ../loginform.do";
		}

		return "suppleprefer";
	}

	@RequestMapping("prefer/supplereq.do")
	@ResponseBody
	public Map<String, Object> request(@RequestBody int subcat_id) {
		logger.info("INFO - AJAX REQUSET [SUPPLEMENT]");

		Map<String, Object> res = new HashMap<String, Object>();
		List<SuppleDto> supple = sBiz.selectList(subcat_id);
		res.put("supple", supple);

		return res;
	}

}
