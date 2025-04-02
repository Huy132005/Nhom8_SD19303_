package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class LienHeController {
    @GetMapping("/lienHe/hien-thi")
    public String hienThiLienHe() {
        return "lienHe/hien-thi";
    }
}
