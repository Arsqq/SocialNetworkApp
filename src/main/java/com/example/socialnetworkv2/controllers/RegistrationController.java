package com.example.socialnetworkv2.controllers;

import com.example.socialnetworkv2.domain.User;
import com.example.socialnetworkv2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    UserService userService;


    @GetMapping("/registration")
    public String register() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model){

        if(!userService.addUser(user)){
            model.put("message","User exists!");
            return "registration";
        }


        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
            boolean isActive=userService.activateUser(code);

            if(isActive){
                model.addAttribute("message","user successfully activated");
            }
            else{
                model.addAttribute("message","Activation code not found");
            }
            return "login";
    }
}


