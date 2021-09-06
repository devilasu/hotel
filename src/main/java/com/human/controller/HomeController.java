package com.human.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.mapper.iRoom;
import com.human.vo.LoginInfo;
import com.human.vo.MemberInfo;
import com.human.vo.Roominfo;
import com.human.vo.Roomtype;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	SqlSession sqlSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping(value="/rooms",method = RequestMethod.GET)
	@ResponseBody
	public List<Roominfo> getRooms() {
		iRoom room = sqlSession.getMapper(iRoom.class);
		List<Roominfo> roomList = room.getRoomList();
		return roomList;
	}
	@RequestMapping(value="/rooms",method = RequestMethod.DELETE)
	@ResponseBody
	public HttpStatus deleteRoom(@RequestParam("roomcode")int roomcode) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.deleteRoom(roomcode);
		return HttpStatus.OK;
	}
	
	@RequestMapping(value="/rooms",method = RequestMethod.POST)
	@ResponseBody
	public HttpStatus insertRoom(@RequestBody Roominfo roominfo) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		if(room.searchRoom(roominfo.getRoomcode()).equals(null)) {
			room.insertRoom(roominfo);
		}else {
			room.updateRoom(roominfo);
		}
		
		return HttpStatus.OK;
	}
	
	@RequestMapping(value="/roomtypes",method = RequestMethod.GET)
	@ResponseBody
	public List<Roomtype> getRoomTypes() {
		iRoom room = sqlSession.getMapper(iRoom.class);
		List<Roomtype> typeList = room.getRoomType();
		return typeList;
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		return "loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request,LoginInfo loginInfo, Model model) {
		HttpSession session = request.getSession();
		iRoom room = sqlSession.getMapper(iRoom.class);
		MemberInfo memberInfo = room.getMember(loginInfo);
		if(memberInfo != null)
			session.setAttribute("uid", memberInfo.getName());
		return "redirect:/booking";
	}
	
	@RequestMapping(value="/booking", method = RequestMethod.GET)
	public String viewInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("uid");
		if(!uid.isEmpty())
			if(uid.equals("admin"))
				return "booking";
		return "redirect:/loginForm";
	}
	
	@RequestMapping(value="/room", method = RequestMethod.GET)
	public String room(Model model,@ModelAttribute("uid")String uid) {
		iRoom room = sqlSession.getMapper(iRoom.class);
//		ArrayList<Roominfo> roominfo = room.getRoomList();
//		model.addAttribute("list", roominfo);
		model.addAttribute("type", room.getRoomType());
		return "room";
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		
		return "joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(MemberInfo memberInfo) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.joinMember(memberInfo);
		return "redirect:/loginForm";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
