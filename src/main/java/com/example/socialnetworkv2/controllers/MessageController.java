package com.example.socialnetworkv2.controllers;

import com.example.socialnetworkv2.domain.Message;
import com.example.socialnetworkv2.domain.User;
import com.example.socialnetworkv2.domain.dto.MessageDto;
import com.example.socialnetworkv2.repo.MessageRepo;
import com.example.socialnetworkv2.service.FileUploaderService;
import com.example.socialnetworkv2.service.MessageService;
import lombok.SneakyThrows;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class MessageController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    FileUploaderService fileUploaderService;

    @Autowired
    private MessageService messageService;

    private final Logger LOG = LoggerFactory.getLogger(MessageController.class);

    @GetMapping("/")
    public String greeting(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", user);
        return "greetings";
    }

    @GetMapping("/home")
    public String home(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", user);
        return "home";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       Model model,@PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                       @AuthenticationPrincipal User user) {
        Page<MessageDto> page=messageService.messageList(pageable, filter,user);

        model.addAttribute("page", page);
        model.addAttribute("url","/main");
        model.addAttribute("filter", filter);


        return "main";
    }

    @SneakyThrows
    @PostMapping("/main")
    public String add(@RequestParam("file") MultipartFile file,
                      @RequestParam(required = false, defaultValue = "") String filter,
                      @AuthenticationPrincipal User user,
                      @Valid Message message,
                      BindingResult bindingResult,
                      @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable,
                      Model model
    ) {
        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            message.setFilename(fileUploaderService.uploadFile(file));
            messageRepo.save(message);
        }
        model.addAttribute("url", "/main");
        Page<MessageDto> page=messageService.messageList(pageable, filter,user);
        model.addAttribute("page", page);
        model.addAttribute("filter", "");


        return "main";
    }


    @GetMapping("/user-messages/{author}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<MessageDto> page = messageService.messageListForUser(pageable,currentUser,author);
        model.addAttribute("userChannel", author);
        model.addAttribute("isSubscribed", author.getSubscribers().contains(currentUser));
        model.addAttribute("subscriptionsCount", author.getSubscriptions().size());
        model.addAttribute("subscribersCount", author.getSubscribers().size());
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url","/user-messages/" + author.getId());
        return "userMessages";
    }

    @PostMapping("/user-messages/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (message.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text)) {
                message.setText(text);
            }

            if (!StringUtils.isEmpty(tag)) {
                message.setTag(tag);
            }


            message.setFilename(fileUploaderService.uploadFile(file));
            messageRepo.save(message);
        }

        return "redirect:/user-messages/" + user;
    }

    @PostMapping("/user-messages/{user}/{id}")
    public String deleteMessage(
            @PathVariable Long id, @PathVariable Long user, Model model) {

        Message message=messageRepo.findById(id).get();
        model.addAttribute("message",message);
        model.addAttribute("messageAlert","Message was successfully deleted!");
        messageRepo.delete(message);
        return "redirect:/user-messages/" + user;
    }
    @GetMapping("/messages/{message}/like")
    public String like(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = message.getLikes();

        if (likes.contains(currentUser)) {
            likes.remove(currentUser);
        } else {
            likes.add(currentUser);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }

    @GetMapping("/messages/{message}/comments")
    public String comment(@PathVariable Message message) {
        return "comments";
    }

}