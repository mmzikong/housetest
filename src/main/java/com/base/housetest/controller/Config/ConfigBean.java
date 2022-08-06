package com.base.housetest.controller.Config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;

@Configuration
public class ConfigBean {

    @Bean
    public DefaultKaptcha getDefaultKaptcha(){
        DefaultKaptcha dk = new DefaultKaptcha();
        Properties properties = new Properties();
        // 是否有边框 默认为true 我们可以自己设置yes，no
        properties.put("kaptcha.border", "yes");
        // 边框颜色
        properties.put("kaptcha.border.color","105,179,90");
        // 验证码文本字符颜色 默认为Color.BLACK
        properties.put("kaptcha.textproducer.font.color","blue");
        // 验证码图片宽度 默认为200
        properties.put("kaptcha.image.width","125");
        // 验证码图片高度 默认为50
        properties.put("kaptcha.image.height","45");
        // 验证码文本字符大小 默认为40
        properties.put("kaptcha.textproducer.font.size","45");
        // KAPTCHA_SESSION_KEY
        properties.put("kaptcha.session.key","code");
        // 验证码文本字符长度 默认为5
        properties.put("kaptcha.textproducer.char.length","4");
        // 验证码文本字体样式 默认为new Font("Arial", 1, fontSize), new Font("Courier", 1, fontSize)
        properties.put("kaptcha.textproducer.font.names","宋体,楷体,微软雅黑");

        // 图片样式 水纹com.google.code.kaptcha.impl.WaterRipple 鱼眼com.google.code.kaptcha.impl.FishEyeGimpy 阴影com.google.code.kaptcha.impl.ShadowGimpy
        properties.setProperty("KAPTCHA_OBSCURIFICATOR_IMPL", "com.google.code.kaptcha.impl.ShadowGimpy");

        Config config = new Config(properties );
        dk.setConfig(config);
        return dk;
    }

}
