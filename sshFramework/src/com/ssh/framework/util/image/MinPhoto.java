package com.ssh.framework.util.image;


import javax.imageio.ImageIO;
//import javax.imageio.IIOException;
import java.awt.image.BufferedImage;
//import java.awt.Image;
import java.io.File;
import java.awt.image.AffineTransformOp;
import java.awt.geom.AffineTransform;

public class MinPhoto {

    public static void minPhoto (String oldPhotoPath, String newPhotoPath) {
        try {
            File fi = new File(oldPhotoPath); //大图文件
            File fo = new File(newPhotoPath); //将要转换出的小图文件

            AffineTransform transform = new AffineTransform();
            BufferedImage bis = ImageIO.read(fi);

            int w = bis.getWidth();
            int h = bis.getHeight();
            @SuppressWarnings("unused")
			double scale = (double)w/h;

            int nw = 120;
            int nh = (nw * h) / w;
            if(nh>120) {
                nh = 120;
                nw = (nh * w) / h;
            }

            double sx = (double)nw / w;
            double sy = (double)nh / h;

            transform.setToScale(sx,sy);

            AffineTransformOp ato = new AffineTransformOp(transform, null);
            BufferedImage bid = new BufferedImage(nw, nh, BufferedImage.TYPE_3BYTE_BGR);
            ato.filter(bis,bid);
            ImageIO.write(bid, "jpeg", fo);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}

