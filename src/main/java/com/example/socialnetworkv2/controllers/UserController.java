package com.example.socialnetworkv2.controllers;

import com.example.socialnetworkv2.domain.Role;
import com.example.socialnetworkv2.domain.User;
import com.example.socialnetworkv2.repo.UserRepo;
import com.example.socialnetworkv2.service.FileUploaderService;
import com.example.socialnetworkv2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    UserRepo userRepo;
    @Autowired
    private FileUploaderService fileUploaderService;

    @GetMapping
    public String displayUsers(Model model){
        model.addAttribute("users",userService.findAll());
        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(Model model, @PathVariable User user){
        model.addAttribute("user",user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(@RequestParam String username,
            @RequestParam Map<String,String> form,
            Model model, @RequestParam("userId") User user){
       userService.saveUser(user,username,form);
        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User currentUser) {
        User user=userRepo.findByUsername(currentUser.getUsername());
        model.addAttribute("user",user);
        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam("file") MultipartFile file,
            @RequestParam String password,
            @RequestParam String email,
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String phone,
            @RequestParam Integer age,Model model
    ) {
        user.setFilename(fileUploaderService.uploadFile(file));
        userService.updateProfile(user, password, email,name,surname,phone,age);
        userRepo.save(user);
        return "redirect:/user/profile";
    }

    @GetMapping("subscribe/{user}")
    public String subscribe(@PathVariable User user, @AuthenticationPrincipal User currentUser){

        userService.subscribe(currentUser,user);

        return "redirect:/user-messages/"+ user.getId();
    }


    @GetMapping("unsubscribe/{user}")
    public String unsubscribe(@PathVariable User user, @AuthenticationPrincipal User currentUser){

        userService.unsubscribe(currentUser,user);

        return "redirect:/user-messages/"+ user.getId();
    }

    @GetMapping("{type}/{user}/list")
    public String userList(Model model, @PathVariable User user,@PathVariable String type){
        model.addAttribute("userChannel",user);
        model.addAttribute("type",type);

        if("subscriptions".equals(type)){
            model.addAttribute("users",user.getSubscriptions());
        }else{
            model.addAttribute("users",user.getSubscribers());
        }
        return "subscriptions";
    }

}
