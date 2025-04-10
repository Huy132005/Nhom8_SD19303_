package com.example.duanagile.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
    @GetMapping("/menu/hien-thi")
    public String hienThiMenu() {
        return "menu";
    }
}
