package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {
    @GetMapping("/dang-nhap/hien-thi")
    public String showLoginForm() {
        return "DangNhap/hien-thi";
    }
    @GetMapping("/dang-ky/hien-thi")
    public String register() {
        return "DangKy/hien-thi";
    }
}
