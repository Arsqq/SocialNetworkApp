package com.example.socialnetworkv2.controllers;

import com.example.socialnetworkv2.domain.Message;
import com.example.socialnetworkv2.domain.User;
import com.example.socialnetworkv2.repo.MessageRepo;
import com.example.socialnetworkv2.service.FileUploaderService;
import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    FileUploaderService fileUploaderService;

    private final Logger LOG= LoggerFactory.getLogger(MainController.class);

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greetings";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
      List<Message> messages = messageRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);


        return "main";
    }

    @SneakyThrows
    @PostMapping("/main")
    public String add(@RequestParam("file") MultipartFile file,
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map<String, Object> model
    ) {
        Message message = new Message(text, tag, user);
        message.setFilename(fileUploaderService.uploadFile(file));
        messageRepo.save(message);
        List<Message> messages = messageRepo.findAll();

        model.put("messages", messages);
        model.put("filter", "");


        return "main";
    }
}