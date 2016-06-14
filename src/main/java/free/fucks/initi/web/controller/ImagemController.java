package free.fucks.initi.web.controller;

import free.fucks.initi.config.ApplicationConfig;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.HttpServletResponse;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@RestController
@RequestMapping("imagem")
public class ImagemController {

    private static final String USER_IMAGE_FOLDER = "photo";

    private static final String USER_IMAGE_PATH = "photo/%s";

    @RequestMapping(method = RequestMethod.POST, value = "/")
    public String handleFileUpload(@RequestParam(name = "name", required = false) String id,
            @RequestParam("file") MultipartFile file,
            RedirectAttributes redirectAttributes) {

        final String folder = ApplicationConfig.PHOTO_PATH + USER_IMAGE_FOLDER;
        
        if(!(new File(folder).exists()) || !(new File(folder).isDirectory())){
            new File(folder).mkdir();
        }
        
        if (!file.isEmpty()) {
            try {
                final String path = ApplicationConfig.PHOTO_PATH + String.format(USER_IMAGE_PATH, id);

                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path)));
                FileCopyUtils.copy(file.getInputStream(), stream);
                stream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return "";
    }

    @RequestMapping(value = "/files/{file_name}", method = RequestMethod.GET)
    public void getFile(@PathVariable("file_name") String fileName, HttpServletResponse response) {
        try {
            final String path = ApplicationConfig.PHOTO_PATH + String.format(USER_IMAGE_PATH, fileName);

            InputStream is = new FileInputStream(new File(path));
            FileCopyUtils.copy(is, response.getOutputStream());
            response.flushBuffer();
        } catch (IOException ex) {
            throw new RuntimeException("IOError writing file to output stream");
        }

    }
}
