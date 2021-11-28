package com.example.socialnetworkv2.service;

import lombok.SneakyThrows;
import net.bytebuddy.implementation.bytecode.Throw;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Component
public class FileUploaderService {

    @Value("${upload.path}")
    private String uploadPath;
    private String resultFileName;

    @SneakyThrows
    public String uploadFile(MultipartFile file){


        if(file!=null&& !file.getOriginalFilename().isEmpty()){
            File uploadFolder=new File(uploadPath);
            if(!uploadFolder.exists()){
                uploadFolder.mkdir();
            }

            String uuidFile= UUID.randomUUID().toString();
            resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath+"/"+resultFileName));
        }
        return  resultFileName;

    }
}
