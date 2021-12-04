package com.example.socialnetworkv2.service;

import antlr.StringUtils;
import com.example.socialnetworkv2.domain.Role;
import com.example.socialnetworkv2.domain.User;
import com.example.socialnetworkv2.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    MailService mailService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user= userRepo.findByUsername(username);
        if(user==null){
            throw new LockedException("Некорректные данные для авторизации");
        }
            return user;
    }

    public boolean addUser(User user){
        User userFromDb=userRepo.findByUsername(user.getUsername());

        if( userFromDb !=null){
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepo.save(user);

        sendMessage(user);

        return true;
    }


    private void sendMessage(User user) {
        if(!ObjectUtils.isEmpty(user.getEmail())){
            String message=String.format("Hello, %s\n" +
                    "Welcome to Sociality. Please, visit next link: http://localhost:8082/activate/%s",
                    user.getUsername(), user.getActivationCode());
            mailService.send(user.getEmail(),"Activation code",message);
        }
    }

    public boolean activateUser(String code) {

        User user=userRepo.findByActivationCode(code);

        if(user==null){
            return false;
        }

        user.setActivationCode(null);
        userRepo.save(user);
        return true;
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles=Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if(roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    public void updateProfile(User user, String password, String email,
                              String name, String surname, String phone, Integer age) {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        if (isEmailChanged) {
            user.setEmail(email);

            if (!ObjectUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!ObjectUtils.isEmpty(password)) {
            user.setPassword(password);
        }

        user.setName(name);
        user.setSurname(surname);
        user.setPhone(phone);
        user.setAge(age);
        userRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }
    }

    public void subscribe(User currentUser,User user) {
        user.getSubscribers().add(currentUser);
        userRepo.save(user);
    }

    public void unsubscribe(User currentUser, User user) {
        user.getSubscribers().remove(currentUser);
        userRepo.save(user);
    }
}

