package kh.finalproj.hollosekki.market.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Attendance;

@Controller
public class AttendanceController {
   
   @Autowired
   private MarketService mkService;
   
   
   @RequestMapping("attendance_Checking.ma")
   public void attendanceCheck(HttpSession session, HttpServletResponse response, @ModelAttribute Attendance at, Model model) {
      Users u = (Users) session.getAttribute("loginUser");
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("at", at);
      map.put("u", u);
   
      int result = mkService.atTodayChecked(u);
      if(result < 1) {
         mkService.atInsert(map);
         mkService.gettedPoint(map);
         mkService.getMonthPoint(map);
         mkService.aDateCheck(map);
         mkService.atPointList(map);
      }
      Attendance monthAt = mkService.monthCheckUser(map);
      if(monthAt != null) {
    	  mkService.monthChecked(monthAt);
      }
      
      ArrayList<Attendance> atList = mkService.allAt(u);
      GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
      Gson gson = gb.create();
      String json = gson.toJson(atList);
      try {
         response.getWriter().write(json);
      } catch (IOException e) {
         e.printStackTrace();
      }
      model.addAttribute("result", result);
    }
             

   @RequestMapping("attendance_Check.ma")
   public ModelAndView attendanceChecking(HttpSession session,ModelAndView mv,HttpServletRequest request){
       Users u = (Users) session.getAttribute("loginUser");
       int result = mkService.atTodayChecked(u);
       request.setAttribute("result", result);
       
      String viewpage = "attendance_Check";
      ArrayList<Attendance> calendar = null;
      try {
         calendar = mkService.allAt(u);
         request.setAttribute("calendarList", calendar);
      } catch (Exception e) {
         e.printStackTrace();
      }
      mv.setViewName(viewpage);
      return mv;
   }       
          
   @RequestMapping("point.ma")
   public void sendPoint(HttpSession session, HttpServletResponse response) {
      Users u = (Users) session.getAttribute("loginUser");
      Users list = null;
      if(u != null) {
         list = mkService.sendPoint(u);
      }
      response.setContentType("application/json; charset=UTF-8"); 
      GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
      Gson gson = gb.create();
      try {
         gson.toJson(list, response.getWriter());
      } catch (JsonIOException | IOException e) {
         e.printStackTrace();
      }
   }
   
}